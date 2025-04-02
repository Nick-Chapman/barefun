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
import Stage0_AST (Literal(..))

----------------------------------------------------------------------
compile :: SRC.Loadable -> Transformed
compile l = runAsm (compileL l)
--  VMemAddr MemAddr
--  VCodeLabel CodeLabel
--  DataLabel

compileL :: SRC.Loadable -> Asm ()
compileL = \case
  SRC.Run code -> undefined code compileC
  SRC.LetTop (SRC.Ref _ x) rhs body -> do
    reg <- compileT rhs
    setLocation x reg
    compileL body


setLocation :: SRC.Location -> Reg -> Asm ()
setLocation = undefined

compileT :: SRC.Top -> Asm Reg
compileT = \case
  SRC.TopLit x -> undefined (compileLit x)
  SRC.TopPrim b xs -> undefined b xs
  SRC.TopLam x body -> undefined x body
  SRC.TopConApp tag xs -> undefined tag xs -- HERE -- do some (static) allocation

compileLit :: Literal -> Asm ()
compileLit = \case
    LitC c -> undefined VChar  c
    LitN n -> undefined VNum n
    LitS s -> undefined s

compileC :: SRC.Code -> Asm ()
compileC = \case
  SRC.Return _ x -> undefined x
  SRC.Tail x1 _pos x2 -> undefined x1 x2
  SRC.LetAlias x y body -> undefined x y body
  SRC.LetAtomic x rhs body -> undefined x rhs body compileA
  SRC.PushContinuation pre post (x,later) first -> undefined pre post x later first
  SRC.Case scrut arms -> undefined scrut arms compileArm

compileA :: SRC.Atomic -> Asm ()
compileA = \case
  SRC.Prim b xs -> undefined b xs compileBuiltin
  SRC.ConApp tag xs -> undefined tag xs compileAllocate
  SRC.Lam pre post x body -> undefined pre post x body
  SRC.RecLam pre post f x body -> undefined pre post f x body

compileAllocate :: Asm ()
compileAllocate = undefined Sp

compileBuiltin :: Builtin -> Asm ()
compileBuiltin = undefined Ax

compileArm :: SRC.Arm -> Asm ()
compileArm (SRC.ArmTag c xs rhs) = undefined c xs rhs


-- TODO: compilation monad -- Asm a

instance Functor Asm where fmap = liftM
instance Applicative Asm where pure = AsmRet; (<*>) = ap
instance Monad Asm where (>>=) = AsmBind

data Asm a where -- execution monad
  -- handles state for regs/memory & code access from image
  AsmRet :: a -> Asm a
  AsmBind :: Asm a -> (a -> Asm b) -> Asm b

runAsm :: Asm () -> Image
runAsm m = loop image0 m k0
  where
    k0 i () = i
    loop :: Image -> Asm a -> (Image -> a -> Image) -> Image
    loop i = \case
      AsmRet x -> \k -> undefined k x i
      AsmBind m f -> \k -> loop i m $ \i a -> loop i (f a) k


image0 :: Image
image0 = undefined

----------------------------------------------------------------------
type Transformed = Image

data Image = Image
  { code :: Map CodeLabel Code
  , vals :: Map DataLabel [Val]
  , start :: CodeLabel
  }
  deriving Show

data Reg = Ax | Sp -- | Bx | Sp | Bp -- | ... -- longer names so it is clear these are regs
  deriving Show

data Code
  = Do Op Code
  | Done Jump
  deriving Show

data Jump
  = JumpDirect CodeLabel
  | JumpIndirect Reg -- must contain a CodeLabel
  deriving Show

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
  deriving Show

data Op -- target; source
  = OpMove Reg Reg
  | OpLoadLit Reg Val
  | OpLoadMemDirect Reg MemAddr
  | OpLoadMemIndirect Reg Reg -- target-reg must contain a MemAddr
  | OpStore MemAddr Reg
  | OpStoreIndirectOffset Reg Int Reg -- target-reg must contain MemAddr
  | OpCall MyBiosRoutine
--   | OpBranch
--   | OpAddIn | OpSubIn
  deriving Show

data MemAddr = MemAddr Int -- needs to be a numbers, so we can do offseting
  deriving Show
data CodeLabel = CodeLabel Id
  deriving Show
data DataLabel = DataLabel Id
  deriving Show

type Id = String -- temp hack. me can use whatever providence we have from the SRC

data MyBiosRoutine
  = BiosPutCharInAx
  | BiosGetCharInAx
--   | initiate GC from here
  deriving Show


----------------------------------------------------------------------
-- TODO pretty print ASM Image
-- for now we half-arse it with deriving Show

----------------------------------------------------------------------

execute :: Transformed -> Interaction
execute = undefined runM execImage

execImage :: Image -> M ()
execImage Image{} =
  undefined code vals start execCode

execCode :: Code -> M ()
execCode = \case
  Do op code -> undefined op code execOp
  Done jump -> undefined jump execJump

execOp :: Op -> M ()
execOp = \case
  OpMove{} -> undefined SetReg GetReg
  OpLoadLit{} -> undefined
  OpLoadMemDirect{} -> undefined GetMem
  OpLoadMemIndirect{} -> undefined
  OpStore{} -> undefined SetMem
  OpStoreIndirectOffset{} -> undefined
  OpCall{} -> undefined execBios

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
    loop :: M a -> State -> (State -> a -> Interaction) -> Interaction
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

data State -- TODO: reg state and mem state
