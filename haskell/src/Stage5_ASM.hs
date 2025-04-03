-- | Locate identifier references at runtime; lift globals
module Stage5_ASM
  ( execute
  , compile
  ) where

import qualified Stage4_CCF as SRC
import Interaction (Interaction)
import Data.Map (Map)
import Control.Monad (ap,liftM)
import Builtin (Builtin)
import qualified Builtin as SRC (Builtin(..))
import Stage0_AST (Literal(..))
import qualified Data.Map as Map
import Stage1_EXP (Ctag(..))

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
compile x = runAsm (compileLoadable x >>= CutCode)

compileLoadable :: SRC.Loadable -> Asm Code
compileLoadable = \case
  SRC.Run code -> compileC code
  SRC.LetTop (SRC.Ref _ loc) rhs body -> do
    (ops1,reg) <- compileTopDef rhs
    let ops2 = setLocation loc reg
    doOps (ops1++ops2) <$> compileLoadable body

compileTopDef ::SRC.Top -> Asm ([Op],Reg) -- TODO: prefer static allocation
compileTopDef = \case
  SRC.TopLit x -> undefined (compileLit x)
  SRC.TopPrim b xs -> undefined b xs
  SRC.TopLam _x body -> do
    c :: CodeLabel <- compileC body >>= CutCode
    let v :: Val = VCodeLabel c
    let op :: Op = OpPush (SLit v)
    pure ([op],Sp)

  SRC.TopConApp tag xs -> do
    let vTag = SLit $ compileCtag tag
    let vs = map compileRef xs
    ops <- pure $ map OpPush (reverse (vTag : vs))
    pure (ops,Sp)

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
  let frameReg :: Reg = Bp -- TODO: gloablly picked?
  let argReg :: Reg = Ax -- TODO: global calling convention
  let codeReg :: Reg = Bx -- TODO: global calling convention
  doOps
    [ OpMove frameReg fun -- TODO: do, first need to indirect to get code * set frame
    , OpMove argReg arg
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
    state0 = State { u = 1 }
    loop :: State -> Asm a -> (State -> a -> Image) -> Image
    loop s = \case
      AsmRet x -> \k -> k s x
      AsmBind m f -> \k -> loop s m $ \s a -> loop s (f a) k
      CutCode code -> \k -> do
        let State{u} = s
        let lab = CodeLabel u
        let image@Image{cmap} = k s { u = u+1 } lab
        image { cmap = Map.insert lab code cmap }

data State = State { u :: Int }

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
  = VChar Char
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

data MemAddr = MemAddr Int -- needs to be a numbers, so we can do offseting

data CodeLabel = CodeLabel Int -- unique lables is enough; TODO: add providence
  deriving (Eq,Ord)

data DataLabel = DataLabel Id

type Id = String -- temp hack. me can use whatever providence we have from the SRC

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
    VChar c -> show c
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
instance Show MemAddr where show (MemAddr n) = show n -- TODO: use hex?

instance Show MyBiosRoutine where
  show = \case
    BiosGetCharInAx -> "bios_get_char"
    BiosPutCharInAx -> "bios_put_char"

----------------------------------------------------------------------

execute :: Transformed -> Interaction
execute = undefined runM execImage

execImage :: Image -> M ()
execImage Image{} =
  undefined start execCode

execCode :: Code -> M ()
execCode = \case
  Do op code -> undefined op code execOp
  Done jump -> undefined jump execJump

execOp :: Op -> M ()
execOp = \case
  OpMove{} -> undefined -- SetReg GetReg
  OpStore{} -> undefined SetMem
  OpCall{} -> undefined execBios
  OpPush{} -> undefined

execBios :: MyBiosRoutine -> M ()
execBios = \case
  BiosGetCharInAx{} -> undefined GetChar
  BiosPutCharInAx{} -> undefined PutChar

execJump :: Jump -> M ()
execJump = \case
  JumpDirect{} -> undefined GetCode
  JumpIndirect{} -> undefined

----------------------------------------------------------------------

instance Functor M where fmap = liftM
instance Applicative M where pure = Ret; (<*>) = ap
instance Monad M where (>>=) = Bind

data M a where -- execution monad. name X maybe
  -- handles state for regs/memory & code access from image
  Ret :: a -> M a
  Bind :: M a -> (a -> M b) -> M b
  SetReg :: Reg -> Val -> M ()
  GetReg :: Reg -> M Val
  SetMem :: MemAddr -> Val -> M ()
  GetMem :: MemAddr -> M Val
  PutChar :: Char -> M ()
  GetChar :: M Char
  GetCode :: CodeLabel -> M Code -- static code lookup

runM :: Image -> M a -> a
runM = undefined loop
  -- TODO: init mem from vals portion of image
  where
    loop :: M a -> XState -> (XState -> a -> Interaction) -> Interaction
    loop m s k = case m of
      Ret x -> undefined x k
      Bind m f -> undefined m f
      SetReg r v -> undefined r v s
      GetReg r -> undefined r
      SetMem a v -> undefined a v
      GetMem a -> undefined a
      PutChar c -> undefined c
      GetChar -> undefined
      GetCode lab -> undefined lab

data XState -- TODO: reg state and mem state
