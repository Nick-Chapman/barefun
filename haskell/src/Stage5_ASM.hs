-- | Generate x86 assembly
module Stage5_ASM
  ( execute, TraceFlag(..)
  , compile
  ) where

import Builtin (Builtin)
import Control.Monad (ap,liftM)
import Data.Char (ord)
import Data.List (intercalate)
import Data.Map (Map)
import Prelude hiding (Word)
import Stage1_EXP (Ctag(..))
import Text.Printf (printf)
import Value (Interaction(..))
import Value (Number,tTrue,tFalse,tNil)
import qualified Builtin as SRC (Builtin(..))
import qualified Data.Char as Char (chr,ord)
import qualified Data.Map as Map
import qualified Stage4_CCF as SRC
import qualified Value as I (Tickable(Op,Alloc))

bytesPerWord :: Int
bytesPerWord = 2 -- TODO: We use this only in the x86 printer.

type Transformed = Image

data Image = Image
  { cmap :: Map CodeLabel Code
  , dmap :: Map DataLabel [Word]
  , start :: CodeLabel
  }

data Code
  = Do Op Code
  | Done Jump

data Op -- target; source
  = OpComment String
  | OpMove Reg Source
  | OpStore Addr Source
  | OpStoreR Reg Source
  | OpCall BareBios
  | OpPush Source
  | OpCmp Source Source -- the first source can't be [ax] - but [bx] is ok. what are the x86 rules?
  | OpBranchFlagZ CodeLabel
  | OpAddInto Reg Source
  | OpSubInto Reg Source

data Jump
  = JumpDirect CodeLabel
  | JumpReg Reg
  | JumpIndirect Reg
  | Crash

data Source
  = SReg Reg
  | SLit Word
  | SMem Addr
  | SMemIndirect Reg
  | SMemIndirectOffset Reg Int

-- Word is a structured type for the contents of a register or memory location
-- We use a variant type to help catch compiler bugs during dev.
-- On a real system, the representations will overlap.
-- Tagging will distinguish pointer from non-pointer.

data Word
  = WChar Char
  | WNum Number
  | WAddr Addr
  | WCodeLabel CodeLabel
  deriving Eq

vTag :: Ctag -> Word
vTag (Ctag _ n) = WNum n

data Reg = Ax | Bx | Cx | Dx | Sp | Bp | Si | Di -- when needed
  deriving (Eq,Ord)

data Addr -- memory address
  = Physical Int
  | Symbolic DataLabel Int
  deriving (Eq,Ord)

data CodeLabel = CodeLabel Int String -- unique label and provenance
  deriving (Eq,Ord)

data DataLabel = DataLabel SRC.Global
  deriving (Eq,Ord)

-- BareBios; primitive routines available to the compiled code
data BareBios
  = Bare_halt
  | Bare_crash
  | Bare_put_char
  | Bare_get_char
  | Bare_make_bool_from_z
  | Bare_make_bool_from_n
  | Bare_num_to_char
  | Bare_char_to_num
  | Bare_string_length
  | Bare_make_bytes
  | Bare_set_bytes
  | Bare_get_bytes
  | Bare_mul
  | Bare_div
  | Bare_mod
  -- Bare_check_heap_space -- TODO: generate Check at eery code entry point
  deriving Show

----------------------------------------------------------------------
-- Show

instance Show Image where
  show Image{cmap,dmap,start} =
    unlines [ printf "%s: ; %s\n%s" (show lab) provenance (show code)
            | (lab@(CodeLabel _ provenance),code) <- Map.toList cmap ]
    ++
    unlines [ printf "%s: dw %s" (show lab) (intercalate ", " (map show vals))
            | (lab,vals) <- Map.toList dmap ]
    ++ printf "\nbare_start: jmp %s" (show start)

instance Show Code where
  show = \case
    Do op code -> "  " ++ show op ++ "\n" ++ show code
    Done jump -> "  " ++ show jump ++ "\n"

instance Show Op where
  show = \case
    OpComment message ->  ";; " ++ message
    OpMove r src -> "mov " ++ show r ++ ", " ++ show src
    OpStore a src -> "mov [" ++ show a ++ "], " ++ show src
    OpStoreR t src -> "mov word [" ++ show t ++ "], " ++ show src
    OpCall bare -> "call " ++ show bare
    OpPush src -> "push word " ++ show src
    OpCmp r src -> "cmp word " ++ show r ++ ", " ++ show src
    OpBranchFlagZ lab ->  "jz " ++ show lab
    OpAddInto r src -> "add " ++ show r ++ ", " ++ show src
    OpSubInto r src -> "sub " ++ show r ++ ", " ++ show src

instance Show Jump where
  show = \case
    JumpDirect c -> "jmp "  ++ show c
    JumpReg r -> "jmp "  ++ show r
    JumpIndirect r -> "jmp ["  ++ show r ++ "]"
    Crash -> "crash"

instance Show Source where
  show = \case
    SReg r -> show r
    SLit w -> show w
    SMem a -> "["++show a++"]"
    SMemIndirect r -> "["++show r++"]"
    SMemIndirectOffset r n -> "["++show r++"+"++show (bytesPerWord * n)++"]"

instance Show Word where
  show = \case
    -- nasm requires backticks around escape sequences
    WChar c -> do
      let n = ord c
      if c == '\n' then "`\\n`" else
        if c == '\'' then "`\'`" else
          if (n < 32 || n > 126) then show n else show c
    WNum n -> show n
    WAddr a -> show a
    WCodeLabel lab -> show lab

instance Show Reg where
  show = \case
    Ax -> "ax"
    Bx -> "bx"
    Cx -> "cx"
    Dx -> "dx"
    Sp -> "sp"
    Bp -> "bp"
    Si -> "si"
    Di -> "di"

instance Show Addr where
  show = \case
    Physical n -> show (bytesPerWord * n)
    Symbolic d 0 -> printf "%s" (show d)
    Symbolic d n -> printf "%s+%d" (show d) n

instance Show CodeLabel where show (CodeLabel n _) = "L" ++ show n
instance Show DataLabel where show (DataLabel g) = show g

----------------------------------------------------------------------
-- Execute

data TraceFlag = TraceOn | TraceOff

execute :: Transformed -> TraceFlag -> Interaction
execute i trace = runM trace i (execImage i)

execImage :: Image -> M ()
execImage Image{start} = GetCode start >>= execCode

execCode :: Code -> M ()
execCode = \case
  Do (OpComment{}) code -> execCode code
  Do op code -> do
    TraceOp op -- TODO: move to compile time to allow debug on qemu/real-hardware
    execOp op (execCode code)
  Done jump -> do
    TraceJump jump
    execJump jump

execOp :: Op -> M () -> M ()
execOp = \case
  OpComment{} -> error "execOp/OpComment"
  OpMove r s -> \cont -> do w <- evalSource s; SetReg r w; cont
  OpStore a s -> \cont -> do w <- evalSource s; SetMem a w; cont
  OpStoreR t s -> \cont -> do
    a <- deAddr <$> GetReg t
    w <- evalSource s
    SetMem a w
    cont
  OpCall bare -> \cont -> do execBare bare; cont
  OpPush s -> \cont -> do
    w <- evalSource s
    execPush w
    cont
  OpCmp s1 s2 -> \cont -> do
    w1 <- evalSource s1
    w2 <- evalSource s2
    SetFlagZ (equalW w1 w2)
    SetFlagN (lessW w1 w2) -- i.e. a subtraction would go negative
    cont
  OpBranchFlagZ lab -> \cont -> do
    b <- GetFlagZ
    case b of
      False -> cont -- branch not taken
      True -> GetCode lab >>= execCode -- branch taken; ignore the continuation
  OpAddInto r s -> execBinaryOp (+) r s
  OpSubInto r s -> execBinaryOp (-) r s

execPush :: Word -> M ()
execPush w = do
  TraceAlloc
  a <- deAddr <$> GetReg Sp
  let a' = prevAddr a
  SetMem a' w
  SetReg Sp (WAddr a')

execBinaryOp :: (Number -> Number -> Number) -> Reg -> Source -> M () -> M ()
execBinaryOp f r s = \cont -> do
    w1 <- GetReg r
    w2 <- evalSource s
    SetReg r (binaryW f w1 w2)
    cont

evalSource :: Source -> M Word
evalSource = \case
  SReg r -> GetReg r
  SLit w -> pure w
  SMem a -> GetMem a
  SMemIndirect r -> do
    a <- deAddr <$> GetReg r
    GetMem a
  SMemIndirectOffset r i -> do
    a <- deAddr  <$> GetReg r
    GetMem (addAddr i a)

execBare :: BareBios -> M ()
execBare = \case
  Bare_halt -> Halt
  Bare_crash -> error "Bare_crash"
  Bare_get_char -> do c <- GetChar; SetReg Ax (WChar c)
  Bare_put_char -> do c <- deChar <$> GetReg Ax; PutChar c
  Bare_make_bool_from_z -> do
    b <- GetFlagZ
    SetReg Ax (WAddr (if b then aTrue else aFalse))
  Bare_make_bool_from_n -> do
    b <- GetFlagN
    SetReg Ax (WAddr (if b then aTrue else aFalse))

  -- On real hardware Num/Char will have overlapping representations
  -- such that ord/chr have null implementations

  -- TODO: avoid these being Bare routines.
  -- instead have pseudo "reinterpret" op, which is omitted (just printed as a comment) in the generated x86
  Bare_num_to_char -> do
    n <- deNum <$> GetReg Ax
    SetReg Ax (WChar (Char.chr (fromIntegral n)))
  Bare_char_to_num -> do
    c <- deChar <$> GetReg Ax
    SetReg Ax (WNum (fromIntegral $ Char.ord c))

  Bare_make_bytes -> do
    n <- deNum <$> GetReg Ax
    w <- createBytesInMemory n
    SetReg Ax w

  Bare_string_length -> do
    -- TODO: no need for Bare given better string rep; just generate ops
    -- 3x cases: Bare_string_length, Bare_set_bytes, Bare_get_bytes
    a <- deAddr <$> GetReg Ax
    n <- deNum <$> GetMem a
    SetReg Ax (WNum n)

  Bare_set_bytes -> do
    a <- deAddr <$> GetReg Ax
    i <- deNum <$> GetReg Bx
    c <- deChar <$> GetReg Si
    let a' = addAddr (fromIntegral i + 1) a  -- +1 for the length info
    SetMem a' (WChar c)

  Bare_get_bytes -> do
    a <- deAddr <$> GetReg Ax
    i <- deNum <$> GetReg Bx
    let a' = addAddr (fromIntegral i + 1) a  -- +1 for the length info
    c <- GetMem a'
    SetReg Ax c

  Bare_mul -> do
    w1 <- GetReg Ax
    w2 <- GetReg Bx
    SetReg Ax (binaryW (*) w1 w2)

  Bare_div -> do
    w1 <- GetReg Ax
    w2 <- GetReg Bx
    SetReg Ax (binaryW div w1 w2)

  Bare_mod -> do
    w1 <- GetReg Ax
    w2 <- GetReg Bx
    SetReg Ax (binaryW mod w1 w2)

createBytesInMemory :: Number -> M Word
createBytesInMemory n = loop n
  -- TODO: if we dont care about initializing the bytes, we could just decrement the stack pointer
  -- This is what we do in x86 runtime. Initialization will happen in caller code.
  where
    loop = \case
      0 -> do
        execPush (WNum n)
        GetReg Sp
      i -> do
        execPush (WChar '\0')
        loop (i-1)

execJump :: Jump -> M ()
execJump = \case
  JumpDirect{} -> undefined GetCode
  JumpReg r -> do
    w <- GetReg r
    let lab = deCodeLabel w
    code <- GetCode lab
    execCode code
  JumpIndirect r -> do
    a <- deAddr <$> GetReg r
    w <- GetMem a
    let lab = deCodeLabel w
    code <- GetCode lab
    execCode code
  Crash -> do
    error "Crash"

binaryW :: (Number -> Number -> Number) -> Word -> Word -> Word
binaryW f w1 w2 =
  case (w1,w2) of
    (WNum n1,WNum n2) -> WNum (f n1 n2)
    _ -> error (show ("binaryW/unexpected-types",w1,w2))

equalW :: Word -> Word -> Bool
equalW w1 w2 =
  case (w1,w2) of
    (WNum{},WNum{}) -> (w1==w2)
    (WChar{},WChar{}) -> (w1==w2)
    -- We shouldn't be comparing any other values
    _ -> error (show ("equalW/unexpected-types",w1,w2))

lessW :: Word -> Word -> Bool
lessW w1 w2 =
  case (w1,w2) of
    (WNum n1,WNum n2) -> (n1 < n2)
    _ -> error (show ("lessW/unexpected-types",w1,w2))

deAddr :: Word -> Addr
deAddr = \case WAddr x -> x; w -> error (show("deAddr",w))

deCodeLabel :: Word -> CodeLabel
deCodeLabel = \case WCodeLabel x -> x; w -> error (show ("deCodeLabel",w))

deChar :: Word -> Char
deChar = \case WChar x -> x; w -> error (show("deChar",w))

deNum :: Word -> Number
deNum = \case WNum x -> x; w -> error (show("deNum",w))

-- TODO: we should be accessing memory in word (2-byte) units
-- Need to sort this before we move to a packed char representation for bytes/string
prevAddr :: Addr -> Addr
prevAddr = addAddr (-1)

addAddr :: Int -> Addr -> Addr
addAddr i = \case
  Physical n -> Physical (n+i)
  Symbolic lab n -> Symbolic lab (n+i) -- I had a nasty bug here -- 1 instead of i :(

----------------------------------------------------------------------
-- Execution monad (emulation!)

instance Functor M where fmap = liftM
instance Applicative M where pure = Ret; (<*>) = ap
instance Monad M where (>>=) = Bind

data M a where
  Ret :: a -> M a
  Bind :: M a -> (a -> M b) -> M b
  Halt :: M ()
  TraceOp :: Op -> M ()
  TraceJump :: Jump -> M ()
  TraceAlloc :: M ()
  GetCode :: CodeLabel -> M Code
  SetReg :: Reg -> Word -> M ()
  GetReg :: Reg -> M Word
  SetMem :: Addr -> Word -> M ()
  GetMem :: Addr -> M Word
  SetFlagZ :: Bool -> M ()
  GetFlagZ :: M Bool
  SetFlagN :: Bool -> M ()
  GetFlagN :: M Bool
  PutChar :: Char -> M ()
  GetChar :: M Char

runM :: TraceFlag  -> Image -> M () -> Interaction
runM traceFlag Image{cmap=cmapUser,dmap} m = loop stateLoaded m k0

  where

    stateLoaded = state0 dmap

    k0 _s () = IDone

    cmap = Map.insert finalCodeLabel finalCode cmapUser
    finalCode = Do (OpCall Bare_halt) (Done Crash)

    trace :: String -> Interaction -> Interaction
    trace = case traceFlag of
      TraceOn -> ITrace
      TraceOff -> \_s i -> i

    traceOpOJump thing s k = trace (show s ++ " ") $ ITick I.Op $ do
      let State{countOps,lastCodeLabel,offsetFromLastLabel} = s
      trace (printf "#%03d: %s.%d : %s\n"
             countOps
             (show lastCodeLabel)
             offsetFromLastLabel
             thing
            ) $
        k s { countOps = 1 + countOps
            , offsetFromLastLabel = 1 + offsetFromLastLabel
            } ()

    loop :: State -> M a -> (State -> a -> Interaction) -> Interaction
    loop s@State{rmap,mem,flagZ,flagN} m k = case m of

      Ret x -> k s x
      Bind m f -> loop s m $ \s a -> loop s (f a) k
      Halt -> IDone

      TraceOp op -> traceOpOJump (show op) s k
      TraceJump jump -> traceOpOJump (show jump) s k
      TraceAlloc{} -> ITick I.Alloc $ k s ()

      GetCode lab -> do
        k s { lastCodeLabel = lab, offsetFromLastLabel = 0 } (maybe err id $ Map.lookup lab cmap)
        where err = error (show ("runM/GetCode",lab))

      SetReg r w -> k s { rmap = Map.insert r w rmap } ()
      GetReg r -> k s (maybe err id $ Map.lookup r rmap)
        where err = error (show ("GetReg/uninitialized",r))

      SetMem a w -> k s { mem = Map.insert a w mem } ()
      GetMem a -> k s (maybe err id $ Map.lookup a mem)
        where err = error (show ("GetMem/uninitialized",a))

      SetFlagZ b -> k s { flagZ = b } ()
      GetFlagZ -> k s flagZ

      SetFlagN b -> k s { flagN = b } ()
      GetFlagN -> k s flagN

      PutChar c -> IPut c (k s ())
      GetChar -> IGet $ \c -> k s c


data State = State
  { rmap :: Map Reg Word
  , mem :: Map Addr Word
  , flagZ :: Bool
  , flagN :: Bool
  , countOps :: Int
  , lastCodeLabel :: CodeLabel
  , offsetFromLastLabel :: Int
  }

state0 :: Map DataLabel [Word] -> State
state0 dmap = State
  { mem
  , rmap
  , flagZ = error "flagZ/uninitialized"
  , flagN = error "flagN/uninitialized"
  , countOps = 0
  , lastCodeLabel = error "lastCodeLabel"
  , offsetFromLastLabel = error "offsetFromLastLabel"
  }
  where
    initialStackPointer = Physical 0 -- stack address are negative in stage5 emulation
    rmap = Map.fromList
      [ (Sp, WAddr initialStackPointer)
      , (Cx, WAddr aFinalCont)
      ]
    mem = Map.fromList (internal ++ user)

    internal =
      [ (aFalse, vTag tFalse)
      , (aTrue, vTag tTrue)
      , (aNil, vTag tNil)
      , (aFinalCont, WCodeLabel finalCodeLabel)
      , (addAddr 1 aFinalCont, WChar 'X') -- dummy next cont; without this we see error with -trace
      ]
    user =
      concat [ [(Symbolic lab i,w) | (i,w) <- zip [0..] vals ]
             | (lab,vals) <- Map.toList dmap
             ]

instance Show State where
  show State{rmap} =
    intercalate " " [ show k ++ "=" ++ show w | (k,w) <- Map.toList rmap ]

-- Address for User Temps: 1..30
-- Address for runtime system constants: 90,91,92

tempOffset :: Int -> Addr
tempOffset n = Physical n

aFalse,aTrue,aNil,aFinalCont :: Addr
aFalse = Physical 90
aTrue = Physical 91
aNil = Physical 92
aFinalCont = Physical 93

finalCodeLabel :: CodeLabel
finalCodeLabel = CodeLabel 0 "FINAL"

----------------------------------------------------------------------
-- Compile

compile :: SRC.Image -> Transformed
compile x = runAsm (compileImage x >>= CutCode "Start")

-- Calling conventions:
frameReg,argReg,contReg :: Reg
-- Ax is the general scratch register
frameReg = Bp
argReg = Dx
contReg = Cx
-- TODO: idea: use remaining regs for temps 1,2... etc

compileImage :: SRC.Image -> Asm Code
compileImage = \case
  SRC.Run code -> compileCode code
  SRC.LetTop (_,g) rhs body -> do
    let lab = DataLabel g
    vals <- compileTopDef lab rhs
    CutData lab vals
    compileImage body

compileTopDef :: DataLabel -> SRC.Top -> Asm [Word]
compileTopDef lab = \case
  SRC.TopPrim b xs -> undefined b xs -- TODO: provoke or remove

  SRC.TopLitS string ->
    pure ([ WNum (fromIntegral $ length string) ] ++
          [ WChar c | c <- string ])

  SRC.TopLam _x body -> do
    lab <- compileCode body >>= CutCode ("Function: " ++ show lab)
    let w1 = WCodeLabel lab
    pure [w1]
  SRC.TopConApp (Ctag _ tag) xs -> do
    pure (WNum tag : map compileTopRef xs)

compileTopRef :: SRC.Ref -> Word
compileTopRef = \case
    SRC.RefLitC c -> WChar c
    SRC.RefLitN n -> WNum n
    SRC.Ref _ loc -> do
    case loc of
      SRC.InGlobal g -> WAddr (Symbolic (DataLabel g) 0)
      _ -> error "compileTopRef"

compileCode :: SRC.Code -> Asm Code
compileCode = \case
  SRC.Return _pos res -> do
    pure $ doOps
      -- position info in comments in generated ASM is very unstable to tiny changes.
      [ --OpComment $ printf "(%s) Return: %s" (show _pos) (ppRef res)
        OpMove argReg (compileRef res)
      , OpMove frameReg (SReg contReg)
      , OpMove contReg (SMemIndirectOffset frameReg 1)
      ] (Done (JumpIndirect frameReg))

  SRC.Tail fun _pos arg -> do
    pure $ doOps (
      -- [ OpComment $ printf "(%s) Tail: %s @ %s" (show _pos) (ppRef fun) (ppRef arg) ] ++
      -- (arg,frame) = ...
       moveTwoRegsPar (frameReg,compileRef fun) (argReg,compileRef arg) ++
      []) (Done (JumpIndirect frameReg))

  SRC.LetAtomic (_,t) rhs body -> do
    (ops1,reg) <- compileAtomic (show t) rhs
    let ops2 = [setTemp t (SReg reg)]
    doOps (ops1++ops2) <$> compileCode body

  SRC.PushContinuation pre _post (_x,later) first -> do
    lab <- compileCode later >>= CutCode "Continuation"
    let
      ops =
        map OpPush (reverse (map compileRef pre)) ++
        [ OpPush (SReg contReg)
        , OpPush (SLit (WCodeLabel lab))
        , OpMove contReg (SReg Sp)
        ]
    doOps ops <$> compileCode first

  SRC.Match scrut arms -> do
    case reverse arms of
      [] -> error "match expression with no arms: should not be allowed by syntax"
      lastArm:armsR -> do
        let scrutReg = Bx -- indexable in cmp op
        let ops1 = [ OpMove scrutReg (compileRef scrut) ]
        ops2 <- concat <$> mapM (compileArm scrutReg) (reverse armsR)
        doOps (ops1 ++ ops2) <$> compileArmTaken scrutReg lastArm

compileArm :: Reg -> SRC.Arm -> Asm [Op]
compileArm scrutReg arm =  do
  let (SRC.ArmTag pos (Ctag _ n) _xs _rhs) = arm
  code <- compileArmTaken scrutReg arm
  lab <- CutCode ("Arm: " ++ show pos) code
  pure [ OpCmp (SMemIndirect scrutReg) (SLit (WNum n))
       , OpBranchFlagZ lab
       ]

compileArmTaken :: Reg -> SRC.Arm -> Asm Code
compileArmTaken scrutReg arm =  do
  let (SRC.ArmTag _pos _tag xs rhs) = arm
  let ops = concat [ [ OpMove Ax (SMemIndirectOffset scrutReg i)
                     , setTemp temp (SReg Ax) ]
                   | (i,(_,temp)) <- zip [1..] xs
                   ]
  doOps ops <$> compileCode rhs

-- assign two regs in parallel, using a temp id required
moveTwoRegsPar :: (Reg,Source) -> (Reg,Source) -> [Op]
moveTwoRegsPar (r1,s1) (r2,s2) = do
  let op1 = OpMove r1 s1
  let op2 = OpMove r2 s2
  let oneTwo = needs r2 s1
  let twoOne = needs r1 s2
  case (oneTwo,twoOne) of
    (True,True) ->
      [ --OpComment "use temp di while setting up bp/dx"
        OpMove Di (SReg r1)
      , OpMove r1 s1
      , OpMove r2 (changeRegInSource r1 Di s2)
      ]
    (True,_) -> [op1,op2]
    (_,True) -> [op2,op1]
    (False,False) -> [op1,op2] -- either order will do

needs :: Reg -> Source -> Bool
needs r2 = \case
  SReg r -> (r==r2)
  SLit{} -> False
  SMem{} -> False
  SMemIndirect r -> (r==r2)
  SMemIndirectOffset r _ -> (r==r2)

changeRegInSource :: Reg -> Reg -> Source -> Source
changeRegInSource r1 r2 = \case
  SReg r -> SReg (if r==r1 then r2 else r1)
  s@SLit{} -> s
  s@SMem{} -> s
  SMemIndirect r -> SMemIndirect (if r==r1 then r2 else r1)
  SMemIndirectOffset r i -> SMemIndirectOffset (if r==r1 then r2 else r1) i

compileAtomic :: String -> SRC.Atomic -> Asm ([Op],Reg)
compileAtomic who = \case
  SRC.Prim b xs -> pure (compileBuiltin b (map compileRef xs), Ax)
  SRC.ConApp (Ctag _ tag) xs -> pure (compileConApp tag xs, Sp)
  SRC.Lam pre _post _x body -> compileFunction who pre body
  SRC.RecLam pre _post _f _x body -> compileFunction who pre body

compileConApp :: Number -> [SRC.Ref] -> [Op]
compileConApp tag xs = construct tag (map compileRef xs)

construct :: Number -> [Source] -> [Op]
construct tag xs = map OpPush (reverse (SLit (WNum tag) : xs))

compileFunction :: String -> [SRC.Ref] -> SRC.Code -> Asm ([Op],Reg)
compileFunction who freeVars body = do
  lab <- compileCode body >>= CutCode ("Function: " ++ who)
  pure (
    map OpPush (reverse (map compileRef freeVars)) ++
    [ OpPush (SLit (WCodeLabel lab))
    ],Sp)

-- TODO: target reg should be passed down
compileBuiltin :: Builtin -> [Source] -> [Op] -- --> Ax
compileBuiltin b = case b of
  SRC.GetChar -> oneArg $ \_ ->
    [ OpCall Bare_get_char ]
  SRC.PutChar -> oneArg $ \s1 ->
    [ OpMove Ax s1
    , OpCall Bare_put_char
    ]
  SRC.EqChar -> twoArgs $ \s1 s2 ->
    [ OpMove Ax s1
    , OpCmp (SReg Ax) s2
    , OpCall Bare_make_bool_from_z
    ]
  SRC.AddInt -> twoArgs $ \s1 s2 ->
    [ OpMove Ax s1
    , OpAddInto Ax s2
    ]
  SRC.SubInt -> twoArgs $ \s1 s2 ->
    [ OpMove Ax s1
    , OpSubInto Ax s2
    ]
  SRC.MulInt -> twoArgs $ \s1 s2 ->
    [ OpMove Ax s1
    , OpMove Bx s2
    , OpCall Bare_mul
    ]
  SRC.DivInt -> twoArgs $ \s1 s2 ->
    [ OpMove Ax s1
    , OpMove Bx s2
    , OpCall Bare_div
    ]
  SRC.ModInt -> twoArgs $ \s1 s2 ->
    [ OpMove Ax s1
    , OpMove Bx s2
    , OpCall Bare_mod
    ]
  SRC.EqInt -> twoArgs $ \s1 s2 ->
    [ OpMove Ax s1
    , OpCmp (SReg Ax) s2
    , OpCall Bare_make_bool_from_z
    ]
  SRC.LessInt -> twoArgs $ \s1 s2 ->
    [ OpMove Ax s1
    , OpCmp (SReg Ax) s2
    , OpCall Bare_make_bool_from_n
    ]
  SRC.StringLength -> oneArg $ \s1 ->
    [ OpMove Ax s1
    , OpCall Bare_string_length
    ]
  SRC.CharChr -> oneArg $ \s1 ->
    [ OpMove Ax s1
    , OpCall Bare_num_to_char
    ]
  SRC.CharOrd -> oneArg $ \s1 ->
    [ OpMove Ax s1
    , OpCall Bare_char_to_num
    ]
  SRC.MakeBytes -> oneArg $ \s1 ->
    [ OpMove Ax s1
    , OpCall Bare_make_bytes
    ]
  -- TODO: avoid Builtins for null-imp.
  -- Instead have an identity function in Predefined which will get normalized away
  SRC.FreezeBytes -> oneArg $ \s1 ->
    -- null-imp, bytes and string have the same representation
    [ OpMove Ax s1 ]

  SRC.ThawBytes -> oneArg $ \s1 ->
    -- null-imp, bytes and string have the same representation
    [ OpMove Ax s1 ]

  SRC.SetBytes -> threeArgs $ \s1 s2 s3 ->
    [ OpMove Ax s1
    , OpMove Bx s2
    , OpMove Si s3
    , OpCall Bare_set_bytes
    ]

  SRC.GetBytes -> twoArgs $ \s1 s2 ->
    [ OpMove Ax s1
    , OpMove Bx s2
    , OpCall Bare_get_bytes
    ]

  -- exactly same as GetBytes (TODO: can we merge the two builtin?)
  SRC.StringIndex -> twoArgs $ \s1 s2 ->
    [ OpMove Ax s1
    , OpMove Bx s2
    , OpCall Bare_get_bytes
    ]

  SRC.MakeRef -> oneArg $ \s1 ->
    [ OpPush s1
    , OpMove Ax (SReg Sp)
    ]

  SRC.DeRef -> oneArg $ \s1 ->
    [ OpMove Bx s1
    , OpMove Ax (SMemIndirect Bx)
    ]

  SRC.SetRef -> twoArgs $ \s1 s2 ->
    [ OpMove Bx s1
    , OpMove Ax s2
    , OpStoreR Bx (SReg Ax)
    ]

  SRC.Crash -> oneArg $ \_ -> [ OpCall Bare_crash ]

  where
    err = error (printf "Stage5.compileBuiltin: error: %s" (show b))
    oneArg f = \case [v] -> f v; _ -> err
    twoArgs f = \case [v1,v2] -> f v1 v2; _ -> err
    threeArgs f = \case [v1,v2,v3] -> f v1 v2 v3; _ -> err


setTemp :: SRC.Temp -> Source -> Op
setTemp (SRC.Temp n) source = OpStore (tempOffset n) source

compileRef :: SRC.Ref -> Source
compileRef = \case
    SRC.RefLitC c -> SLit (WChar c)
    SRC.RefLitN n -> SLit (WNum n)
    SRC.Ref _ loc -> do
    case loc of
      SRC.InGlobal g -> SLit (WAddr (Symbolic (DataLabel g) 0))
      SRC.InFrame n -> SMemIndirectOffset frameReg n
      SRC.InTemp (SRC.Temp n) -> SMem (tempOffset n)
      SRC.TheArg -> SReg argReg
      SRC.TheFrame -> SReg frameReg

doOps :: [Op] -> Code -> Code
doOps ops c = foldr Do c ops

{-ppRef :: SRC.Ref -> String
ppRef = \case
  SRC.RefLitC c -> show c
  SRC.RefLitN n -> show n
  SRC.Ref id loc ->
    show id ++ " (" ++ show loc ++ ")"
-}

----------------------------------------------------------------------
-- Asm: compilation monad

instance Functor Asm where fmap = liftM
instance Applicative Asm where pure = AsmRet; (<*>) = ap
instance Monad Asm where (>>=) = AsmBind

data Asm a where
  AsmRet :: a -> Asm a
  AsmBind :: Asm a -> (a -> Asm b) -> Asm b
  CutCode :: String -> Code -> Asm CodeLabel
  CutData :: DataLabel -> [Word] -> Asm ()

runAsm :: Asm CodeLabel  -> Image
runAsm m = loop state0 m k0
  where
    state0 = AsmState { u = 1 } -- user code labels start at 1; 0 labels the code for the final continuation
    k0 _s start = Image { cmap = Map.empty, dmap = Map.empty, start }

    loop :: AsmState -> Asm a -> (AsmState -> a -> Image) -> Image
    loop s = \case
      AsmRet x -> \k -> k s x
      AsmBind m f -> \k -> loop s m $ \s a -> loop s (f a) k
      CutCode prov code -> \k -> do
        let AsmState{u} = s
        let lab = CodeLabel u prov
        let image@Image{cmap} = k s { u = u+1 } lab
        image { cmap = Map.insert lab code cmap }
      CutData lab vals -> \k -> do
        let image@Image{dmap} = k s ()
        image { dmap = Map.insert lab vals dmap }

data AsmState = AsmState { u :: Int }
