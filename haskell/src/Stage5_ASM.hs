-- | Locate identifier references at runtime; lift globals
module Stage5_ASM
  ( execute
  , compile
  ) where

import Builtin (Builtin)
import Control.Monad (ap,liftM)
import Data.Map (Map)
import Interaction (Interaction(..))
import Stage0_AST (Literal(..))
import Stage1_EXP (Ctag(..))
import Text.Printf (printf)
import qualified Builtin as SRC (Builtin(..))
import qualified Data.Map as Map
import qualified Stage4_CCF as SRC

----------------------------------------------------------------------
type Transformed = Image

data Image = Image
  { cmap :: Map CodeLabel Code
  , dmap :: Map DataLabel [Val]
  , start :: CodeLabel
  }

-- maybe longer names so it is clear these are regs
-- or maybe move generic/abstract names, which can be mapped to concrete x86 registers later
data Reg = Ax | Bx | Sp | Bp
  deriving (Eq,Ord)

data Code
  = Do Op Code
  | Done Jump

data Jump
  = JumpDirect CodeLabel
  | JumpIndirect Reg -- must contain a CodeLabel

-- Val: what's in a regsiter or a memory location.
-- we use a variant type here to help catch any compiler bugs during dev
-- but eventually these will share the same 16b or 32b word
-- and each reference will have to know exactly how to interpreter the value
-- mostly not a problem
-- except for GC which need to distinguish pointer from non-pointer
-- Possible solutions to this. (1) Tagging. (2) Descriptor Word
data Val
  = VNotInitialized String
  | VChar Char
  | VNum Int -- at some point gonna have to decide on 16b or 32b numbers (or 15/31 if we tag)
  | VMemAddr MemAddr
  | VCodeLabel CodeLabel

data Op -- target; source
  = OpMove Reg Source
  | OpStore MemAddr Reg -- TODO: generalise MemAddr to Target
  | OpCall MyBiosRoutine
  | OpPush Source
--   | OpBranch
--   | OpAddIn | OpSubIn

data Source
  = SReg Reg
  | SLit Val
  | SMem MemAddr
  | SMemIndirect Reg
  | SMemIndirectOffset Reg Int

-- data Target -- TODO

-- TODO: maybe no point in a new type for MemAddr, just alias a numeric type
-- and rename Addr
data MemAddr = MemAddr Int -- needs to be a numbers, so we can do offseting
  deriving (Eq,Ord)

data CodeLabel = CodeLabel Int -- unique labels is enough; TODO: add provenance
  deriving (Eq,Ord)

data DataLabel = DataLabel String -- TODO: provenance

data MyBiosRoutine
  = BiosPutCharInAx
  | BiosGetCharInAx
--   | initiate GC from here?

----------------------------------------------------------------------

instance Show Image where
  show Image{cmap,dmap=_,start} =
    "start=" ++ show start ++ "\n" ++
    unlines [ show lab ++ ":\n" ++ show code | (lab,code) <- Map.toList cmap ]

instance Show Code where
  show = \case
    Do op code -> "  " ++ show op ++ "\n" ++ show code
    Done jump -> "  " ++ show jump ++ "\n"

instance Show Op where
  show = \case
    OpMove r src -> "mov " ++ show r ++ ", " ++ show src
    OpStore a r -> "mov [" ++ show a ++ "], " ++ show r
    OpCall mybios -> "call " ++ show mybios
    OpPush src -> "push " ++ show src

instance Show Jump where
  show = \case
    JumpDirect c -> "jmp "  ++ show c
    JumpIndirect r -> "jmp ["  ++ show r ++ "]"

instance Show Source where
  show = \case
    SReg r -> show r
    SLit v -> "#" ++ show v
    SMem a -> show a
    SMemIndirect r -> "["++show r++"]"
    SMemIndirectOffset r n -> "["++show r++"+"++show n++"]"

instance Show Val where
  show = \case
    VNotInitialized m -> printf "[not-initialized:%s]" m
    VChar c -> show c
    -- TODO: number and address look the same. fix? perhaps diff bases
    -- hmm, will make numbers look different.
    -- because simplest impl will be to tag numbers to distinguish from addresses
    VNum n -> show n
    VMemAddr a -> show a
    VCodeLabel c -> show c

instance Show Reg where
  show = \case
    Ax -> "ax"
    Bx -> "bx"
    Sp -> "sp"
    Bp -> "bp"

instance Show DataLabel where show (DataLabel id) = "D" ++ show id
instance Show CodeLabel where show (CodeLabel n) = "L" ++ show n
instance Show MemAddr where show (MemAddr n) = show n

instance Show MyBiosRoutine where
  show = \case
    BiosGetCharInAx -> "bios_get_char"
    BiosPutCharInAx -> "bios_put_char"

----------------------------------------------------------------------

globalOffset :: Int -> MemAddr
globalOffset n = MemAddr (globalStart + n)
  where
    globalStart = 100

tempOffset :: Int -> MemAddr
tempOffset n = MemAddr (tempStart + n)
  where
    tempStart = 200

compile :: SRC.Loadable -> Transformed
compile x = runAsm (compileInit x >>= CutCode)

compileInit :: SRC.Loadable -> Asm Code
compileInit x = do
  doOps [ OpMove Sp (SLit (VMemAddr (MemAddr 0))) ] <$> -- stack address will be negative
    compileLoadable x

compileLoadable :: SRC.Loadable -> Asm Code
compileLoadable = \case
  SRC.Run code -> compileC code
  SRC.LetTop (SRC.Ref _ loc) rhs body -> do
    ops1 <- compileTopDef rhs
    let ops2 = setLocation loc Sp
    doOps (ops1++ops2) <$> compileLoadable body

compileTopDef ::SRC.Top -> Asm [Op]
compileTopDef = \case
  SRC.TopLit x -> undefined (compileLit x)
  SRC.TopPrim b xs -> undefined b xs
  SRC.TopLam _x body -> do
    lab <- compileC body >>= CutCode
    pure
      [ OpPush (SLit (VCodeLabel lab))
      , OpPush (SReg Sp)
      ]

  SRC.TopConApp tag xs -> do
    let vTag = SLit $ compileCtag tag
    let vs = map compileRef xs
    ops <- pure $ map OpPush (reverse (vTag : vs))
    pure ops

compileC :: SRC.Code -> Asm Code
compileC = \case
  SRC.Return _ x -> undefined x

  SRC.Tail x1 _pos x2 -> do
    let v1 = compileRef x1
    let v2 = compileRef x2
    pure $ compileTailCall v1 v2

  SRC.LetAlias x y body -> undefined x y body

  SRC.LetAtomic (SRC.Ref _ loc) rhs body -> do

    -- fairly blindly copied from LetTop
    (ops1,reg) <- compileA rhs
    let ops2 = setLocation loc reg
    doOps (ops1++ops2) <$> compileC body

  SRC.PushContinuation pre post (x,later) first -> undefined pre post x later first
  SRC.Case scrut arms -> undefined scrut arms compileArm

compileA :: SRC.Atomic -> Asm ([Op],Reg)
compileA = \case
  SRC.Prim b xs -> do
    pure (compileBuiltin b xs, Ax)

  SRC.ConApp tag xs -> undefined tag xs compileAllocate
  SRC.Lam pre post x body -> undefined pre post x body
  SRC.RecLam pre post f x body -> undefined pre post f x body

compileBuiltin :: Builtin -> [SRC.Ref] -> [Op]
compileBuiltin b xs = case (b,xs) of
  (SRC.GetChar,[_]) ->
    [ OpCall BiosGetCharInAx
    ]
  (SRC.PutChar,[src]) ->
    [ OpMove Ax (compileRef src)
    , OpCall BiosPutCharInAx
    ]
  b ->
    error (show (b,xs))

compileTailCall :: Source -> Source -> Code
compileTailCall fun arg = do
  -- global calling convention...
  let frameReg = Bp
  let argReg = Ax
  let codeReg = Bx
  doOps
    [ OpMove frameReg fun
    , OpMove frameReg (SMemIndirect frameReg) -- ???
    , OpMove argReg arg
    , OpMove argReg (SMemIndirect argReg) -- ???
    , OpMove codeReg (SMemIndirect frameReg)
    ] (Done (JumpIndirect codeReg))

setLocation :: SRC.Location -> Reg -> [Op]
setLocation loc reg = case loc of
  SRC.Global n -> [OpStore (globalOffset n) reg]
  SRC.InFrame n -> undefined n
  SRC.Temp n -> [OpStore (tempOffset n) reg]
  SRC.TheArg -> undefined
  SRC.TheFrame -> undefined

compileRef :: SRC.Ref -> Source
compileRef (SRC.Ref _ loc) = do
  case loc of
    SRC.Global n -> SMem (globalOffset n)
    SRC.InFrame n -> undefined n
    SRC.Temp n -> SMem (tempOffset n)
    SRC.TheArg -> undefined
    SRC.TheFrame -> undefined

compileCtag :: Ctag -> Val
compileCtag (Ctag _ tag) = VNum tag

compileLit :: Literal -> Asm ()
compileLit = \case
    LitC c -> undefined VChar  c
    LitN n -> undefined VNum n
    LitS s -> undefined s

compileAllocate :: Asm ()
compileAllocate = undefined Sp

compileArm :: SRC.Arm -> Asm ()
compileArm (SRC.ArmTag c xs rhs) = undefined c xs rhs

doOps :: [Op] -> Code -> Code
doOps ops c = foldr Do c ops

----------------------------------------------------------------------
-- compilation monad

instance Functor Asm where fmap = liftM
instance Applicative Asm where pure = AsmRet; (<*>) = ap
instance Monad Asm where (>>=) = AsmBind

data Asm a where -- execution monad
  -- handles state for regs/memory & code access from image
  AsmRet :: a -> Asm a
  AsmBind :: Asm a -> (a -> Asm b) -> Asm b
  CutCode :: Code -> Asm CodeLabel

runAsm :: Asm CodeLabel  -> Image
runAsm m = loop state0 m k0
  where
    k0 _s start = Image { cmap = Map.empty, dmap = Map.empty, start }
    state0 = AsmState { u = 1 }
    loop :: AsmState -> Asm a -> (AsmState -> a -> Image) -> Image
    loop s = \case
      AsmRet x -> \k -> k s x
      AsmBind m f -> \k -> loop s m $ \s a -> loop s (f a) k
      CutCode code -> \k -> do
        let AsmState{u} = s
        let lab = CodeLabel u
        let image@Image{cmap} = k s { u = u+1 } lab
        image { cmap = Map.insert lab code cmap }

data AsmState = AsmState { u :: Int }

----------------------------------------------------------------------

execute :: Transformed -> Interaction
execute i = runM i (execImage i)

execImage :: Image -> M ()
execImage Image{start} = GetCode start >>= execCode

execCode :: Code -> M ()
execCode = \case
  Do op code -> do execOp op; execCode code
  Done jump -> execJump jump

execOp :: Op -> M ()
execOp = \case
  OpMove r s -> do v <- evalSource s; SetReg r v
  OpStore a r -> do v <- GetReg r; SetMem a v
  OpCall bios -> execBios bios
  OpPush s -> do
    v <- evalSource s
    a <- deMemAddr <$> GetReg Sp
    let a' = prevAddr a
    SetMem a' v
    SetReg Sp (VMemAddr a')

evalSource :: Source -> M Val
evalSource = \case
  SReg r -> GetReg r
  SLit v -> pure v
  SMem a -> GetMem a
  SMemIndirect r -> do
    a <- deMemAddr <$> GetReg r
    GetMem a
  SMemIndirectOffset r i -> undefined r i


execBios :: MyBiosRoutine -> M ()
execBios = \case
  BiosGetCharInAx -> do c <- GetChar; SetReg Ax (VChar c)
  BiosPutCharInAx{} -> do c <- deChar <$> GetReg Ax; PutChar c

execJump :: Jump -> M ()
execJump = \case
  JumpDirect{} -> undefined GetCode
  JumpIndirect r -> do
    v <- GetReg r
    let lab = deCodeLabel v
    code <- GetCode lab
    execCode code


deMemAddr :: Val -> MemAddr
deMemAddr = \case VMemAddr x -> x; v -> error (show("deMemAddr",v))

deCodeLabel :: Val -> CodeLabel
deCodeLabel = \case VCodeLabel x -> x; v -> error (show ("deCodeLabel", v))

deChar :: Val -> Char
deChar = \case VChar x -> x; v -> error (show("deChar",v))

prevAddr :: MemAddr -> MemAddr
prevAddr = addAddr (-1)

addAddr :: Int -> MemAddr -> MemAddr
addAddr i (MemAddr n) = MemAddr (n+i)

----------------------------------------------------------------------

instance Functor M where fmap = liftM
instance Applicative M where pure = Ret; (<*>) = ap
instance Monad M where (>>=) = Bind

data M a where -- execution monad. name X maybe
  -- handles state for regs/memory & code access from image
  GetCode :: CodeLabel -> M Code
  Ret :: a -> M a
  Bind :: M a -> (a -> M b) -> M b
  SetReg :: Reg -> Val -> M ()
  GetReg :: Reg -> M Val
  SetMem :: MemAddr -> Val -> M ()
  GetMem :: MemAddr -> M Val
  PutChar :: Char -> M ()
  GetChar :: M Char

xdebug :: Show a => a -> Interaction -> Interaction
xdebug _ i = i
debug :: Show a => a -> Interaction -> Interaction
debug a i = IDebug (show a) i

runM :: Image -> M () -> Interaction
runM Image{cmap} m = loop s0 m k0
  -- TODO: init mem from vals portion of image
  where
    k0 _s () = debug "k0-ended" IDone
    s0 = State { mem = Map.empty, rmap = Map.empty }
    loop :: State -> M a -> (State -> a -> Interaction) -> Interaction
    loop s@State{rmap,mem} m k = case m of
      Ret x -> k s x
      Bind m f -> loop s m $ \s a -> loop s (f a) k

      GetCode lab -> xdebug ("GetCode",lab) $ do
        k s (maybe err id $ Map.lookup lab cmap)
        where err = error (show ("runM/GetCode",lab))

      SetReg r v -> xdebug ("SetReg",r,v) $ do
        k s { rmap = Map.insert r v rmap } ()

      GetReg r -> xdebug ("GetReg",r) $ do
        k s (maybe (VNotInitialized (show r)) id $ Map.lookup r rmap)

      SetMem a v -> xdebug ("SetMem",a,v) $ do
        k s { mem = Map.insert a v mem } ()

      GetMem a -> xdebug ("GetMem",a) $ do
        k s (maybe (VNotInitialized (show a)) id $ Map.lookup a mem)

      PutChar c -> IPut c (k s ())

      GetChar -> do --IDebug "GetChar.." $ do
        IGet $ \c -> do --IDebug (printf "GetChar..got:%s" (show c)) $ do
          k s c

data State = State
  { rmap :: Map Reg Val
  , mem :: Map MemAddr Val
  }
