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
import Value (tTrue,tFalse)

enableDebug :: Bool
enableDebug = False

----------------------------------------------------------------------
type Transformed = Image

data Image = Image
  { cmap :: Map CodeLabel Code
  , dmap :: Map DataLabel [Val]
  , start :: CodeLabel
  }

data Code
  = Do Op Code
  | Done Jump

data Op -- target; source
  = OpMove Reg Source
  | OpStore MemAddr Reg -- TODO: generalise MemAddr to Target
  | OpCall MyBiosRoutine
  | OpPush Source
  | OpCmp Reg Source
--   | OpAddIn | OpSubIn
  | OpBranchFlagZ CodeLabel

data Jump
  = JumpDirect CodeLabel
  | JumpIndirect Reg -- must contain a CodeLabel
  | Crash

data Source
  = SReg Reg
  | SLit Val
  | SMem MemAddr
  | SMemIndirect Reg
  | SMemIndirectOffset Reg Int

-- data Target -- TODO

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
  deriving Eq

-- maybe longer names so it is clear these are regs
-- or maybe move generic/abstract names, which can be mapped to concrete x86 registers later
-- using Ax and Bx as temps everywhere
data Reg = Ax | Bx | Cx | Sp | Bp | RegWhat
  deriving (Eq,Ord)

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
  | BiosMakeBoolFromFlagZ
  | BiosMatchFailure
--   | initiate GC from here?


-- calling conventions
-- TODO: temps should be named/listed here

argReg,frameReg :: Reg
(argReg,frameReg) = (Cx,Bp)


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
    OpStore a r -> "mov " ++ show a ++ ", " ++ show r
    OpCall mybios -> "call " ++ show mybios
    OpPush src -> "push " ++ show src
    OpCmp r src -> "cmp " ++ show r ++ ", " ++ show src
    OpBranchFlagZ lab ->  "bz " ++ show lab

instance Show Jump where
  show = \case
    JumpDirect c -> "jmp "  ++ show c
    JumpIndirect r -> "jmp ["  ++ show r ++ "]"
    Crash -> "crash"

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
    Cx -> "cx"
    Sp -> "sp"
    Bp -> "bp"
    RegWhat -> "r?"

instance Show MemAddr where show (MemAddr n) = show n
instance Show CodeLabel where show (CodeLabel n) = "L" ++ show n
instance Show DataLabel where show (DataLabel id) = "D" ++ show id

instance Show MyBiosRoutine where
  show = \case
    BiosGetCharInAx -> "bios_get_char"
    BiosPutCharInAx -> "bios_put_char"
    BiosMakeBoolFromFlagZ -> "bios_make_bool"
    BiosMatchFailure -> "bios_match_failure"

----------------------------------------------------------------------

aFalse,aTrue :: MemAddr
(aFalse,aTrue) = (MemAddr 10, MemAddr 11) -- specific mem address. perhaps 0,1 is more sensible

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
  SRC.Run code -> compileCode code
  SRC.LetTop (SRC.Ref _ loc) rhs body -> do
    (ops1,reg) <- compileTopDef rhs
    let ops2 = setLocation loc reg
    doOps (ops1++ops2) <$> compileLoadable body

compileTopDef ::SRC.Top -> Asm ([Op],Reg)
compileTopDef = \case
  SRC.TopLit x -> do
    v <- compileLit x
    pure
      ([ OpMove Ax (SLit v)
      ],Ax)
  SRC.TopPrim b xs -> undefined b xs
  SRC.TopLam _x body -> do
    lab <- compileCode body >>= CutCode
    pure (
      [ OpPush (SLit (VCodeLabel lab))
      -- , OpPush (SReg Sp)
      ], Sp)

  SRC.TopConApp tag xs -> do
    let vTag = SLit $ compileCtag tag
    let vs = map compileRef xs
    ops <- pure $ map OpPush (reverse (vTag : vs))
    pure (ops,Sp)

compileLit :: Literal -> Asm Val
compileLit = \case
    LitC c -> pure (VChar c)
    LitN n -> undefined VNum n
    LitS s -> undefined s

compileCode :: SRC.Code -> Asm Code
compileCode = \case
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
    doOps (ops1++ops2) <$> compileCode body

  SRC.PushContinuation pre post (x,later) first -> undefined pre post x later first
  SRC.Case scrut arms -> do
    case arms of
      [] -> undefined scrut compileArm
      [arm1] -> undefined arm1
      [arm1,arm2] -> do
        let s :: Source = compileRef scrut
        -- TODO: share unpacking of the tag (into Bx)
        lab1 <- compileArm s arm1 >>= CutCode
        ops1 <- compileArmBranch s arm1 lab1
        lab2 <- compileArm s arm2 >>= CutCode
        ops2 <- compileArmBranch s arm2 lab2
        pure $ doOps (ops1 ++ ops2) (Done Crash)
      _ ->
        undefined

compileArmBranch :: Source -> SRC.Arm -> CodeLabel -> Asm [Op]
compileArmBranch s (SRC.ArmTag (Ctag _ n) _ _) lab = do
  pure [ OpMove Ax s
       , OpMove Ax (SMemIndirect Ax)
       , OpCmp Ax (SLit (VNum n))
       , OpBranchFlagZ lab
       ]

compileArm :: Source -> SRC.Arm -> Asm Code
compileArm s (SRC.ArmTag _c__CHECK_ME xs rhs) = do
  ops <- sequence [ undefined $ compileArmUnpack x i s | (i,x) <- zip [1..] xs ]
  doOps (concat ops) <$> compileCode rhs

compileArmUnpack :: SRC.Ref -> Int -> Source -> Asm [Op]
compileArmUnpack (SRC.Ref _ loc) i s = do -- TODO not hit yet
  let reg = Bx
  pure $ [ OpMove reg s
         , OpMove reg (SMemIndirectOffset reg i) -- TODO: so this not tried yet
         ] ++ setLocation loc reg

compileA :: SRC.Atomic -> Asm ([Op],Reg)
compileA = \case
  SRC.Prim b xs -> do
    pure (compileBuiltin b xs, Ax)

  SRC.ConApp tag xs -> undefined tag xs compileAllocate
  SRC.Lam pre post x body -> undefined pre post x body

  SRC.RecLam pre _post _f _x body -> do
    lab <- compileCode body >>= CutCode
    pure (
      map OpPush (reverse (map compileRef pre)) ++
      [ OpPush (SLit (VCodeLabel lab))
      , OpMove Ax (SReg Sp)
      ], Ax)

compileBuiltin :: Builtin -> [SRC.Ref] -> [Op] -- --> Ax
compileBuiltin b xs = case (b,xs) of
  (SRC.GetChar,[_]) ->
    [ OpCall BiosGetCharInAx
    ]
  (SRC.PutChar,[src]) ->
    [ OpMove Ax (compileRef src)
    , OpCall BiosPutCharInAx
    ]
  (SRC.EqChar, [s1,s2]) ->
    [ OpMove Ax (compileRef s1)
    , OpCmp Ax (compileRef s2)
    , OpCall BiosMakeBoolFromFlagZ
    ]
  b ->
    error (show (b,xs))

compileTailCall :: Source -> Source -> Code
compileTailCall fun arg = do
  let codeReg = Bx -- this is just a temp; not part of calling convention
  doOps
    [ OpMove argReg arg -- set arg before frame, because it might rely on the old value of frame
    , OpMove frameReg fun
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
    SRC.InFrame n -> SMemIndirectOffset frameReg n
    SRC.Temp n -> SMem (tempOffset n)
    SRC.TheArg -> SReg argReg
    SRC.TheFrame -> SReg frameReg

compileCtag :: Ctag -> Val
compileCtag (Ctag _ tag) = VNum tag

compileAllocate :: Asm ()
compileAllocate = undefined Sp

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
  Do op code -> do
    TraceOp op
    execOp op (execCode code)
  Done jump -> do
    TraceJump jump
    execJump jump

execOp :: Op -> M () -> M ()
execOp = \case
  OpMove r s -> \cont -> do v <- evalSource s; SetReg r v; cont
  OpStore a r -> \cont -> do v <- GetReg r; SetMem a v; cont
  OpCall bios -> \cont -> do execBios bios; cont
  OpPush s -> \cont -> do
    v <- evalSource s
    a <- deMemAddr <$> GetReg Sp
    let a' = prevAddr a
    SetMem a' v
    SetReg Sp (VMemAddr a')
    cont
  OpCmp r s -> \cont -> do
    v1 <- GetReg r
    v2 <- evalSource s
    --Debug ("OpCmp",v1,v2,"...")
    let b = equalV (v1,v2)
    --Debug ("OpCmp",v1,v2,"...",b)
    SetFlagZ b
    cont
  OpBranchFlagZ lab -> \cont -> do
    b <- GetFlagZ
    case b of
      False -> cont
      True -> do
        -- ignore the continuation
        code <- GetCode lab
        execCode code

evalSource :: Source -> M Val
evalSource = \case
  SReg r -> GetReg r
  SLit v -> pure v
  SMem a -> GetMem a
  SMemIndirect r -> do
    a <- deMemAddr <$> GetReg r
    GetMem a
  SMemIndirectOffset r i -> do
    a <- deMemAddr <$> GetReg r
    GetMem (addAddr i a)


execBios :: MyBiosRoutine -> M ()
execBios = \case
  BiosGetCharInAx -> do c <- GetChar; SetReg Ax (VChar c)
  BiosPutCharInAx -> do c <- deChar <$> GetReg Ax; PutChar c
  BiosMakeBoolFromFlagZ -> do
    b <- GetFlagZ
    SetReg Ax (VMemAddr (if b then aTrue else aFalse))
  BiosMatchFailure ->
    undefined

execJump :: Jump -> M ()
execJump = \case
  JumpDirect{} -> undefined GetCode
  JumpIndirect r -> do
    v <- GetReg r
    let lab = deCodeLabel v
    code <- GetCode lab
    execCode code
  Crash -> do
    error "Crash"


equalV :: (Val,Val) -> Bool
equalV (v1,v2) =
  case (v1,v2) of
    (VNum{},VNum{}) -> (v1==v2)
    (VChar{},VChar{}) -> (v1==v2)
    -- don think we should be comparing any other values
    _ -> error (show ("equalV/unexpected-types",v1,v2))

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
  Ret :: a -> M a
  Bind :: M a -> (a -> M b) -> M b
  Debug :: Show a => a -> M ()
  TraceOp :: Op -> M ()
  TraceJump :: Jump -> M ()
  GetCode :: CodeLabel -> M Code
  SetReg :: Reg -> Val -> M ()
  GetReg :: Reg -> M Val
  SetMem :: MemAddr -> Val -> M ()
  GetMem :: MemAddr -> M Val
  SetFlagZ :: Bool -> M ()
  GetFlagZ :: M Bool
  PutChar :: Char -> M ()
  GetChar :: M Char

idebug :: String -> Interaction -> Interaction
idebug s i = if enableDebug then IDebug s i else i

xdebug :: Show a => a -> Interaction -> Interaction
xdebug _ i = i
debug :: Show a => a -> Interaction -> Interaction
debug a i = idebug (show a) i

runM :: Image -> M () -> Interaction
runM Image{cmap} m = loop s0 m k0
  -- TODO: init mem from vals portion of image
  where
    mem = Map.fromList [ (aFalse, VNum tFalse), (aTrue, VNum tTrue) ]
    k0 _s () = debug "k0-ended" IDone
    s0 = State { mem, rmap = Map.empty, flagZ = error "flagZ/undefined", countOps = 0 }
    loop :: State -> M a -> (State -> a -> Interaction) -> Interaction
    loop s@State{rmap,mem,flagZ,countOps} m k = case m of
      Ret x -> k s x
      Bind m f -> loop s m $ \s a -> loop s (f a) k

      TraceOp op -> do
        idebug (printf "%d: %s" countOps (show op)) $
          k s { countOps = 1 + countOps } ()

      TraceJump jump -> do
        idebug (printf "%d: %s" countOps (show jump)) $
          k s { countOps = 1 + countOps } ()

      Debug thing -> do
        IDebug (show thing) $ k s ()

      GetCode lab -> xdebug ("GetCode",lab) $ do
        k s (maybe err id $ Map.lookup lab cmap)
        where err = error (show ("runM/GetCode",lab))

      SetReg r v -> debug ("SetReg",r,v) $ do
        k s { rmap = Map.insert r v rmap } ()

      GetReg r -> do
        --debug ("GetReg",r) $ do
          let v = maybe (VNotInitialized (show r)) id $ Map.lookup r rmap
          debug ("GetReg",r, "->",v) $ do
            k s v

      SetMem a v -> debug ("SetMem",a,v) $ do
        k s { mem = Map.insert a v mem } ()

      GetMem a -> do
        let v = maybe (VNotInitialized (show a)) id $ Map.lookup a mem
        debug ("GetMem",a,"->",v) $ do
          k s v

      SetFlagZ b -> xdebug ("SetFlagZ",b) $ do
        k s { flagZ = b } ()

      GetFlagZ -> xdebug "GetFlagZ" $ do
        k s flagZ

      PutChar c -> IPut c (k s ())

      GetChar -> do --IDebug "GetChar.." $ do
        IGet $ \c -> do --IDebug (printf "GetChar..got:%s" (show c)) $ do
          k s c

data State = State
  { rmap :: Map Reg Val
  , mem :: Map MemAddr Val
  , flagZ :: Bool
  , countOps :: Int
  }
