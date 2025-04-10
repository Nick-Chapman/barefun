-- | Generate x86 assembly
module Stage5_ASM
  ( execute, TraceFlag(..)
  , compile
  ) where

import Builtin (Builtin)
import Control.Monad (ap,liftM)
import Data.List (intercalate)
import Data.Map (Map)
import Data.Word (Word16)
import Interaction (Interaction(..))
import Stage0_AST (Literal(..))
import Stage1_EXP (Ctag(..))
import Text.Printf (printf)
import Value (tTrue,tFalse,tNil,tCons)
import qualified Builtin as SRC (Builtin(..))
import qualified Data.Char as Char (chr,ord)
import qualified Data.Map as Map
import qualified Interaction as I (Tickable(..))
import qualified Stage4_CCF as SRC

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
  = OpComment String
  | OpMove Reg Source
  | OpStore MemAddr Reg -- TODO: generalise MemAddr to Target -- or maybe I dont need.
  | OpCall BareBios
  | OpPush Source
  | OpCmp Source Source -- the first source can't be [ax] - but [bx] is ok. what are the x86 rules?
  | OpBranchFlagZ CodeLabel
  | OpAddInto Reg Source
  | OpSubInto Reg Source
  | OpMulInto Reg Source
  -- TODO: x86 div/mod are the same instruction, makeing uses of specific registers
  | OpDivInto Reg Source
  | OpModInto Reg Source

data Jump
  = JumpDirect CodeLabel
  | JumpIndirect Reg
  | Crash

data Source
  = SReg Reg
  | SLit Val
  | SMem MemAddr
  | SMemIndirect Reg
  | SMemIndirectOffset Reg Int

-- Val is a structure type for the contents of a register or memory location
-- We use a variant type to help catch compiler bugs during dev.
-- On a real system, the representations will overlap.
-- Tagging will distinguish pointer from non-pointer.

data Val -- TODO: rename Word?
  = VChar Char
  | VNum Word16 -- TODO: single definition for the type of tag/numbers across the whole compiler
  | VMemAddr MemAddr
  | VCodeLabel CodeLabel
  deriving Eq

data Reg = Ax | Bx | Cx | Dx | Sp | Bp -- TODO: Si | Di
  deriving (Eq,Ord)

data MemAddr = MemAddr Int -- TODO: rename Addr
  deriving (Eq,Ord)

data CodeLabel = CodeLabel Int String -- unique label and provenance
  deriving (Eq,Ord)

data DataLabel = DataLabel String -- TODO: use!

data BareBios
  = BiosPutCharInAx
  | BiosGetCharInAx
  | BiosMakeBoolFromFlagZ -- TODO: dedup code for Flag Z/N
  | BiosMakeBoolFromFlagN
  | BiosStringLength
  | BiosStringIndex
  | BiosNumToChar
  | BiosCharToNum
  | BiosHalt
--  | BiosCheckHeapSpace -- maybe initiate GC; compile at head of each code section

----------------------------------------------------------------------
-- Show

instance Show Image where
  show Image{cmap,dmap=_,start=_} =
    unlines [ printf "%s: ; %s\n%s" (show lab) provenance (show code)
            | (lab@(CodeLabel _ provenance),code) <- Map.toList cmap ]

instance Show Code where
  show = \case
    Do op code -> "  " ++ show op ++ "\n" ++ show code
    Done jump -> "  " ++ show jump ++ "\n"

instance Show Op where
  show = \case
    OpComment message ->  ";; " ++ message
    OpMove r src -> "mov " ++ show r ++ ", " ++ show src
    OpStore a r -> "mov " ++ show a ++ ", " ++ show r
    OpCall mybios -> "call " ++ show mybios
    OpPush src -> "push " ++ show src
    OpCmp r src -> "cmp " ++ show r ++ ", " ++ show src
    OpBranchFlagZ lab ->  "bz " ++ show lab
    OpAddInto r src -> "add " ++ show r ++ ", " ++ show src
    OpSubInto r src -> "sub " ++ show r ++ ", " ++ show src
    OpMulInto r src -> "mul " ++ show r ++ ", " ++ show src
    OpDivInto r src -> "div " ++ show r ++ ", " ++ show src
    OpModInto r src -> "mod " ++ show r ++ ", " ++ show src

instance Show Jump where
  show = \case
    JumpDirect c -> "jmp "  ++ show c
    JumpIndirect r -> "jmp ["  ++ show r ++ "]"
    Crash -> "crash"

instance Show Source where
  show = \case
    SReg r -> show r
    SLit v -> "#" ++ show v
    SMem a -> show a -- TODO: need square brackets here too!
    SMemIndirect r -> "["++show r++"]"
    SMemIndirectOffset r n -> "["++show r++"+"++show n++"]"

instance Show Val where
  show = \case
    VChar c -> show c
    VNum n -> show n
    VMemAddr a -> show a
    VCodeLabel lab -> show lab

instance Show Reg where
  show = \case
    Ax -> "ax"
    Bx -> "bx"
    Cx -> "cx"
    Dx -> "dx"
    Sp -> "sp"
    Bp -> "bp"

instance Show MemAddr where show (MemAddr n) = show n -- TODO: show Addr in different base
instance Show CodeLabel where show (CodeLabel n _) = "L" ++ show n
instance Show DataLabel where show (DataLabel id) = "D" ++ show id

instance Show BareBios where
  show = \case
    BiosGetCharInAx -> "bios_get_char"
    BiosPutCharInAx -> "bios_put_char"
    BiosMakeBoolFromFlagZ -> "bios_make_bool_from_z"
    BiosMakeBoolFromFlagN -> "bios_make_bool_from_n"
    BiosStringLength -> "bios_string_length"
    BiosStringIndex -> "bios_string_index"
    BiosHalt -> "bios_halt"
    BiosNumToChar -> "bios_num_to_char"
    BiosCharToNum -> "bios_char_to_num"

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
  OpCmp s1 s2 -> \cont -> do
    v1 <- evalSource s1
    v2 <- evalSource s2
    SetFlagZ (equalV v1 v2)
    SetFlagN (lessV v1 v2) -- i.e. a subtraction would go negative
    cont
  OpBranchFlagZ lab -> \cont -> do
    b <- GetFlagZ
    case b of
      False -> cont -- branch not taken
      True -> GetCode lab >>= execCode -- branch taken; ignore the continuation
  OpAddInto r s -> execBinaryOp (+) r s
  OpSubInto r s -> execBinaryOp (-) r s
  OpMulInto r s -> execBinaryOp (*) r s
  OpDivInto r s -> execBinaryOp div r s
  OpModInto r s -> execBinaryOp mod r s

execBinaryOp :: (Word16 -> Word16 -> Word16) -> Reg -> Source -> M () -> M ()
execBinaryOp f r s = \cont -> do
    v1 <- GetReg r
    v2 <- evalSource s
    SetReg r (binaryV f v1 v2)
    cont

evalSource :: Source -> M Val
evalSource = \case
  SReg r -> GetReg r
  SLit v -> pure v
  SMem a -> GetMem a
  SMemIndirect r -> do
    a <- deMemAddr <$> GetReg r
    GetMem a
  SMemIndirectOffset r i -> do
    a <- deMemAddr  <$> GetReg r
    GetMem (addAddr i a)

execBios :: BareBios -> M ()
execBios = \case
  BiosGetCharInAx -> do c <- GetChar; SetReg Ax (VChar c)
  BiosPutCharInAx -> do c <- deChar <$> GetReg Ax; PutChar c
  BiosMakeBoolFromFlagZ -> do
    b <- GetFlagZ
    SetReg Ax (VMemAddr (if b then aTrue else aFalse))
  BiosMakeBoolFromFlagN -> do
    b <- GetFlagN
    SetReg Ax (VMemAddr (if b then aTrue else aFalse))
  BiosHalt -> Halt
  BiosStringLength -> do
    a <- deMemAddr <$> GetReg Ax
    string <- readStringFromMemory a
    SetReg Ax (VNum (fromIntegral $ length string))
  BiosStringIndex -> do
    a <- deMemAddr <$> GetReg Ax
    i <- deNum <$> GetReg Bx
    string <- readStringFromMemory a
    SetReg Ax (VChar (string !! fromIntegral i))
  -- On real hardware Num/Char will have overlapping representations
  -- such that ord/chr have null implementations
  BiosNumToChar -> do
    n <- deNum <$> GetReg Ax
    SetReg Ax (VChar (Char.chr (fromIntegral n)))
  BiosCharToNum -> do
    c <- deChar <$> GetReg Ax
    SetReg Ax (VNum (fromIntegral $ Char.ord c))

-- TODO: improve string rep to avoid this...
readStringFromMemory :: MemAddr -> M String
readStringFromMemory a = do
  n <- deNum <$> GetMem a
  case n of
    0 -> pure []
    1 -> do
      c <- deChar <$> GetMem (addAddr 1 a)
      a' <- deMemAddr <$> GetMem (addAddr 2 a)
      (c:) <$> readStringFromMemory a'
    _ -> error (show ("readStringFromMemory",n))

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

binaryV :: (Word16 -> Word16 -> Word16) -> Val -> Val -> Val
binaryV f v1 v2 =
  case (v1,v2) of
    (VNum n1,VNum n2) -> VNum (f n1 n2)
    _ -> error (show ("binaryV/unexpected-types",v1,v2))

equalV :: Val -> Val -> Bool
equalV v1 v2 =
  case (v1,v2) of
    (VNum{},VNum{}) -> (v1==v2)
    (VChar{},VChar{}) -> (v1==v2)
    -- We shouldn't be comparing any other values
    _ -> error (show ("equalV/unexpected-types",v1,v2))

lessV :: Val -> Val -> Bool
lessV v1 v2 =
  case (v1,v2) of
    (VNum n1,VNum n2) -> (n1 < n2)
    _ -> error (show ("lessV/unexpected-types",v1,v2))

deMemAddr :: Val -> MemAddr
deMemAddr = \case VMemAddr x -> x; v -> error (show("deMemAddr",v))

deCodeLabel :: Val -> CodeLabel
deCodeLabel = \case VCodeLabel x -> x; v -> error (show ("deCodeLabel", v))

deChar :: Val -> Char
deChar = \case VChar x -> x; v -> error (show("deChar",v))

deNum :: Val -> Word16
deNum = \case VNum x -> x; v -> error (show("deNum",v))

prevAddr :: MemAddr -> MemAddr
prevAddr = addAddr (-1)

addAddr :: Int -> MemAddr -> MemAddr
addAddr i (MemAddr n) = MemAddr (n+i)

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
  GetCode :: CodeLabel -> M Code
  SetReg :: Reg -> Val -> M ()
  GetReg :: Reg -> M Val
  SetMem :: MemAddr -> Val -> M ()
  GetMem :: MemAddr -> M Val
  SetFlagZ :: Bool -> M ()
  GetFlagZ :: M Bool
  SetFlagN :: Bool -> M ()
  GetFlagN :: M Bool
  PutChar :: Char -> M ()
  GetChar :: M Char

runM :: TraceFlag  -> Image -> M () -> Interaction
runM traceFlag Image{cmap=cmapUser} m = loop state0 m k0
  -- TODO: init mem from vals portion of image -- and compile top/loadable to use it
  where

    k0 _s () = IDone

    cmap = Map.insert finalCodeLabel finalCode cmapUser
    finalCode = Do (OpCall BiosHalt) (Done Crash)

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

      GetCode lab -> do
        k s { lastCodeLabel = lab, offsetFromLastLabel = 0 } (maybe err id $ Map.lookup lab cmap)
        where err = error (show ("runM/GetCode",lab))

      SetReg r v -> k s { rmap = Map.insert r v rmap } ()
      GetReg r -> k s (maybe err id $ Map.lookup r rmap)
        where err = error (show ("GetReg/uninitialized",r))

      SetMem a v -> k s { mem = Map.insert a v mem } ()
      GetMem a -> k s (maybe err id $ Map.lookup a mem)
        where err = error (show ("GetMem/uninitialized",a))

      SetFlagZ b -> k s { flagZ = b } ()
      GetFlagZ -> k s flagZ

      SetFlagN b -> k s { flagN = b } ()
      GetFlagN -> k s flagN

      PutChar c -> IPut c (k s ())
      GetChar -> IGet $ \c -> k s c


data State = State
  { rmap :: Map Reg Val
  , mem :: Map MemAddr Val
  , flagZ :: Bool
  , flagN :: Bool
  , countOps :: Int
  , lastCodeLabel :: CodeLabel
  , offsetFromLastLabel :: Int
  }

state0 :: State
state0 = State
  { mem
  , rmap
  , flagZ = error "flagZ/uninitialized"
  , flagN = error "flagN/uninitialized"
  , countOps = 0
  , lastCodeLabel = error "lastCodeLabel"
  , offsetFromLastLabel = error "offsetFromLastLabel"
  }
  where
    initialStackPointer = MemAddr 0 -- stack address are negative in stage5 emulation
    rmap = Map.fromList
      [ (Sp, VMemAddr initialStackPointer)
      , (Cx, VMemAddr aFinalCont)
      ]
    mem = Map.fromList
      [ (aFalse, VNum tFalse)
      , (aTrue, VNum tTrue)
      , (aFinalCont, VCodeLabel finalCodeLabel)
      , (addAddr 1 aFinalCont, VChar 'X') -- dummy next cont; without this we see error with -trace
      ]

instance Show State where
  show State{rmap} =
    intercalate " " [ show k ++ "=" ++ show v | (k,v) <- Map.toList rmap ]

-- Address for User Temps: 1..30
-- Address for runtime system constants: 90,91,92
-- Address for User Globals: 101..
tempOffset :: Int -> MemAddr
tempOffset n = MemAddr n

aFalse,aTrue,aFinalCont :: MemAddr
aFalse = MemAddr 90
aTrue = MemAddr 91
aFinalCont = MemAddr 92

globalOffset :: Int -> MemAddr
globalOffset n = MemAddr (n + 100)

finalCodeLabel :: CodeLabel
finalCodeLabel = CodeLabel 0 "FINAL"

----------------------------------------------------------------------
-- Compile

compile :: SRC.Loadable -> Transformed
compile x = runAsm (compileLoadable x >>= CutCode "Start")

-- Calling conventions:
frameReg,argReg,contReg :: Reg
-- Ax is the general scratch register
frameReg = Bp
argReg = Dx
contReg = Cx
-- TODO: idea: use remaining regs for temps 1,2... etc

compileLoadable :: SRC.Loadable -> Asm Code
compileLoadable = \case
  SRC.Run code -> compileCode code
  SRC.LetTop (SRC.Ref _ loc) rhs body -> do
    (ops1,reg) <- compileTopDef (show loc) rhs
    let ops2 = [setLocation loc reg]
    doOps (ops1++ops2) <$> compileLoadable body

-- TODO: TopDefs should really really not generate Push instructions. But instead should generate static data structures.
compileTopDef :: String -> SRC.Top -> Asm ([Op],Reg)
compileTopDef who = \case
  SRC.TopLit x -> do
    let (ops,source) = compileLit x
    pure
      (ops ++ [ OpMove Ax source
      ],Ax)
  SRC.TopPrim b xs -> undefined b xs
  SRC.TopLam _x body -> do
    lab <- compileCode body >>= CutCode ("Function: " ++ who)
    pure (
      [ OpPush (SLit (VCodeLabel lab))
      ], Sp)

  SRC.TopConApp (Ctag _ tag) xs -> do
    pure (compileConApp tag xs, Sp)

compileLit :: Literal -> ([Op],Source)
compileLit = \case
    LitC c -> ([],SLit (VChar c))
    LitN n -> ([],SLit (VNum n))
    LitS string -> do
      -- string rep is currently the same as a list of chars. TODO: do better!
      ([OpPush (SLit (VNum tNil))] ++
        [ op
        | c <- reverse string
        , op <- construct tCons [SLit (VChar c), SReg Sp]
        ],
       SReg Sp)

compileCode :: SRC.Code -> Asm Code
compileCode = \case
  SRC.Return pos res -> do -- TODO: investigate misisng positions in check-compile output
    pure $ doOps
      [ OpComment $ printf "(%s) Return: %s" (show pos) (ppRef res)
      -- arg = ...
      -- frame = cont
      -- cont = frame[1]
      , OpMove argReg (compileRef res)
      , OpMove frameReg (SReg contReg)
      , OpMove contReg (SMemIndirectOffset frameReg 1)
      -- code = frame[0]; jmp [code]
      , OpMove Ax (SMemIndirect frameReg)
      ] (Done (JumpIndirect Ax))

  SRC.Tail fun pos arg -> do
    pure $ doOps (
      [ OpComment $ printf "(%s) Tail: %s @ %s" (show pos) (ppRef fun) (ppRef arg) ] ++
      -- (arg,frame) = ...
       moveTwoRegsPar (frameReg,compileRef fun) (argReg,compileRef arg) ++
      -- code = frame[0]; jmp [code]
      [ OpMove Ax (SMemIndirect frameReg)
      ]) (Done (JumpIndirect Ax))

  SRC.LetAlias x y body -> undefined x y body -- TODO: need an example to provoke this

  SRC.LetAtomic (SRC.Ref _ loc) rhs body -> do
    (ops1,reg) <- compileAtomic (show loc) rhs
    let ops2 = [setLocation loc reg]
    doOps (ops1++ops2) <$> compileCode body

  SRC.PushContinuation pre _post (_x,later) first -> do
    lab <- compileCode later >>= CutCode "Continuation"
    let
      ops =
        map OpPush (reverse (map compileRef pre)) ++
        [ OpPush (SReg contReg)
        , OpPush (SLit (VCodeLabel lab))
        , OpMove contReg (SReg Sp)
        ]
    doOps ops <$> compileCode first

  SRC.Case scrut arms -> do
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
  pure [ OpCmp (SMemIndirect scrutReg) (SLit (VNum n))
       , OpBranchFlagZ lab
       ]

compileArmTaken :: Reg -> SRC.Arm -> Asm Code
compileArmTaken scrutReg arm =  do
  let (SRC.ArmTag _pos _tag xs rhs) = arm
  let ops = concat [ [ OpMove Ax (SMemIndirectOffset scrutReg i)
                     , setLocation loc Ax ]
                   | (i,SRC.Ref _ loc) <- zip [1..] xs
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
      [ OpComment "use temp ax while setting up bp/dx"
      , OpMove Ax (SReg r1)
      , OpMove r1 s1
      , OpMove r2 (changeRegInSource r1 Ax s2)
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

compileConApp :: Word16 -> [SRC.Ref] -> [Op]
compileConApp tag xs = construct tag (map compileRef xs)

construct :: Word16 -> [Source] -> [Op]
construct tag xs = map OpPush (reverse (SLit (VNum tag) : xs))

compileFunction :: String -> [SRC.Ref] -> SRC.Code -> Asm ([Op],Reg)
compileFunction who freeVars body = do
  lab <- compileCode body >>= CutCode ("Function: " ++ who)
  pure (
    map OpPush (reverse (map compileRef freeVars)) ++
    [ OpPush (SLit (VCodeLabel lab))
    ],Sp)

-- TODO: target reg should be passed down
compileBuiltin :: Builtin -> [Source] -> [Op] -- --> Ax
compileBuiltin b xs = case (b,xs) of
  (SRC.GetChar,[_]) ->
    [ OpCall BiosGetCharInAx
    ]
  (SRC.PutChar,[s1]) ->
    [ OpMove Ax s1
    , OpCall BiosPutCharInAx
    ]
  (SRC.EqChar, [s1,s2]) ->
    [ OpMove Ax s1
    , OpCmp (SReg Ax) s2
    , OpCall BiosMakeBoolFromFlagZ
    ]
  (SRC.AddInt, [s1,s2]) ->
    [ OpMove Ax s1
    , OpAddInto Ax s2
    ]
  (SRC.SubInt, [s1,s2]) ->
    [ OpMove Ax s1
    , OpSubInto Ax s2
    ]
  (SRC.MulInt, [s1,s2]) ->
    [ OpMove Ax s1
    , OpMulInto Ax s2
    ]
  (SRC.DivInt, [s1,s2]) ->
    [ OpMove Ax s1
    , OpDivInto Ax s2
    ]
  (SRC.ModInt, [s1,s2]) ->
    [ OpMove Ax s1
    , OpModInto Ax s2
    ]
  (SRC.EqInt, [s1,s2]) ->
    [ OpMove Ax s1
    , OpCmp (SReg Ax) s2
    , OpCall BiosMakeBoolFromFlagZ
    ]
  (SRC.LessInt, [s1,s2]) ->
    [ OpMove Ax s1
    , OpCmp (SReg Ax) s2
    , OpCall BiosMakeBoolFromFlagN
    ]
  (SRC.StringLength, [s1]) ->
    [ OpMove Ax s1
    , OpCall BiosStringLength
    ]
  (SRC.StringIndex, [s1,s2]) ->
    [ OpMove Ax s1
    , OpMove Bx s2
    , OpCall BiosStringIndex
    ]
  (SRC.CharChr, [s1]) ->
    [ OpMove Ax s1
    , OpCall BiosNumToChar
    ]
  (SRC.CharOrd, [s1]) ->
    [ OpMove Ax s1
    , OpCall BiosCharToNum
    ]
  b ->
    error (show (b,xs))

setLocation :: SRC.Location -> Reg -> Op
setLocation loc reg = case loc of
  SRC.Global n -> OpStore (globalOffset n) reg
  SRC.Temp n -> OpStore (tempOffset n) reg
  -- TODO: dont think any of these will be possible. perhaps rejig types in Stage4 to make that clear
  SRC.InFrame n -> undefined n
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

doOps :: [Op] -> Code -> Code
doOps ops c = foldr Do c ops

ppRef :: SRC.Ref -> String
ppRef (SRC.Ref id loc) =
  show id ++ " (" ++ show loc ++ ")"

----------------------------------------------------------------------
-- Asm: compilation monad

instance Functor Asm where fmap = liftM
instance Applicative Asm where pure = AsmRet; (<*>) = ap
instance Monad Asm where (>>=) = AsmBind

data Asm a where
  AsmRet :: a -> Asm a
  AsmBind :: Asm a -> (a -> Asm b) -> Asm b
  CutCode :: String -> Code -> Asm CodeLabel

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

data AsmState = AsmState { u :: Int }
