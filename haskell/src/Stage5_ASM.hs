-- | Locate identifier references at runtime; lift globals
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
  = Do Op Code -- TODO: comment/label/name every op code for debug
  | Done Jump

data Op -- target; source
  = OpComment String
  | OpMove Reg Source
  | OpStore MemAddr Reg -- TODO: generalise MemAddr to Target -- or maybe I dont need.
  | OpCall BareBios
  | OpPush Source
  | OpCmp Reg Source
  | OpAddInto Reg Source
  | OpSubInto Reg Source
  | OpMulInto Reg Source
  | OpDivInto Reg Source -- TODO: check we have an op like this in x86. maybe requires specific regs
  | OpModInto Reg Source -- TODO: check we have an op like this in x86. maybe requires specific regs
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

-- Val: what's in a regsiter or a memory location.
-- we use a variant type here to help catch any compiler bugs during dev
-- but eventually these will share the same 16b or 32b word
-- and each reference will have to know exactly how to interpreter the value
-- mostly not a problem
-- except for GC which need to distinguish pointer from non-pointer
-- Possible solutions to this. (1) Tagging. (2) Descriptor Word
data Val
  = VChar Char
  | VNum Word16 -- TODO: at some point gonna have to decide on 16b or 32b numbers (or 15/31 if we tag)
  | VMemAddr MemAddr
  | VCodeLabel CodeLabel
  deriving Eq

-- maybe longer names so it is clear these are regs
-- or maybe move generic/abstract names, which can be mapped to concrete x86 registers later
-- using Ax and Bx as temps everywhere
data Reg = Ax | Bx | Cx | Dx | Sp | Bp | RegWhat
  deriving (Eq,Ord)

-- TODO: maybe no point in a new type for MemAddr, just alias a numeric type
-- TODO: rename Addr
data MemAddr = MemAddr Int -- needs to be a numbers, so we can do offseting
  deriving (Eq,Ord)

data CodeLabel = CodeLabel Int String -- unique labels is enough; TODO: add provenance
  deriving (Eq,Ord)

data DataLabel = DataLabel String -- TODO: provenance TODO: use!

data BareBios
  = BiosPutCharInAx
  | BiosGetCharInAx
  | BiosMakeBoolFromFlagZ -- TODO: dedup code for Flag Z/N (if we get a 3rd flag!)
  | BiosMakeBoolFromFlagN
  | BiosExplode -- TODO: dont want this in Bios
  | BiosNumToChar
  | BiosCharToNum
  | BiosHalt
--  | BiosCheckHeapSpace -- maybe initiate GC; compile at head of each code section

----------------------------------------------------------------------
-- Show

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
    OpComment message ->  ";; " ++ message
    OpMove r src -> "mov " ++ show r ++ ", " ++ show src
    OpStore a r -> "mov " ++ show a ++ ", " ++ show r
    OpCall mybios -> "call " ++ show mybios
    OpPush src -> "push " ++ show src
    OpCmp r src -> "cmp " ++ show r ++ ", " ++ show src
    OpAddInto r src -> "add " ++ show r ++ ", " ++ show src
    OpSubInto r src -> "sub " ++ show r ++ ", " ++ show src
    OpMulInto r src -> "mul " ++ show r ++ ", " ++ show src
    OpDivInto r src -> "div " ++ show r ++ ", " ++ show src -- TODO: check how written in x86
    OpModInto r src -> "mod " ++ show r ++ ", " ++ show src -- TODO: check how written in x86
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
    VChar c -> show c
    -- TODO: number and address look the same. fix? perhaps diff bases
    -- hmm, will make numbers look different.
    -- because simplest impl will be to tag numbers to distinguish from addresses
    --VNum n -> printf "N:%03d" n
    --VMemAddr (MemAddr n) -> printf "A:%03d" n
    --VCodeLabel (CodeLabel n) -> printf "L:%03d" n
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
    RegWhat -> "r?"

instance Show MemAddr where show (MemAddr n) = show n
instance Show CodeLabel where show (CodeLabel n s) = "L" ++ show n ++ "_" ++ s
instance Show DataLabel where show (DataLabel id) = "D" ++ show id

instance Show BareBios where
  show = \case
    BiosGetCharInAx -> "bios_get_char"
    BiosPutCharInAx -> "bios_put_char"
    BiosMakeBoolFromFlagZ -> "bios_make_bool_from_z"
    BiosMakeBoolFromFlagN -> "bios_make_bool_from_n"
    BiosExplode -> "bios_explode"
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
  OpMove r s -> \cont -> do v <- evalSource "OpMove" s; SetReg r v; cont
  OpStore a r -> \cont -> do v <- GetReg r; SetMem a v; cont
  OpCall bios -> \cont -> do execBios bios; cont
  OpPush s -> \cont -> do
    v <- evalSource "OpPush" s
    a <- deMemAddr "push" <$> GetReg Sp
    let a' = prevAddr a
    SetMem a' v
    SetReg Sp (VMemAddr a')
    cont
  OpCmp r s -> \cont -> do
    v1 <- GetReg r
    v2 <- evalSource "OpCmp" s
    SetFlagZ (equalV v1 v2)
    SetFlagN (lessV v1 v2) -- i.e. a subtraction would go negative
    cont
  OpAddInto r s -> \cont -> do -- TODO: dedup binary op execution
    v1 <- GetReg r
    v2 <- evalSource "OpAddInto" s
    SetReg r (addV v1 v2)
    cont
  OpSubInto r s -> \cont -> do
    v1 <- GetReg r
    v2 <- evalSource "OpSubInto" s
    SetReg r (subV v1 v2)
    cont
  OpMulInto r s -> \cont -> do
    v1 <- GetReg r
    v2 <- evalSource "OpMulInto" s
    SetReg r (mulV v1 v2)
    cont
  OpDivInto r s -> \cont -> do
    v1 <- GetReg r
    v2 <- evalSource "OpDivInto" s
    SetReg r (divV v1 v2)
    cont
  OpModInto r s -> \cont -> do
    v1 <- GetReg r
    v2 <- evalSource "OpModInto" s
    SetReg r (modV v1 v2)
    cont
  OpBranchFlagZ lab -> \cont -> do
    b <- GetFlagZ
    case b of
      False -> cont
      True -> do
        -- ignore the continuation
        code <- GetCode lab
        execCode code


addV :: Val -> Val -> Val
addV = binV (+)

subV :: Val -> Val -> Val -- TODO: inline all these
subV = binV (-)

mulV :: Val -> Val -> Val
mulV = binV (*)

divV :: Val -> Val -> Val
divV = binV div

modV :: Val -> Val -> Val
modV = binV mod

evalSource :: String -> Source -> M Val
evalSource who = \case -- TODO: loose who
  SReg r -> GetReg r
  SLit v -> pure v
  SMem a -> GetMem a
  SMemIndirect r -> do
    a <- deMemAddr (show (who,"source-indirect")) <$> GetReg r
    GetMem a
  SMemIndirectOffset r i -> do
    a <- deMemAddr (show (who,"source-indirect-offset")) <$> GetReg r
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
  BiosHalt -> XHalt
  BiosExplode -> do
    -- null execution effect because
    -- string rep == char list rep
    pure ()
  -- On real hardware Num/Char will have overlapping representations
  -- such that ord/chr have null implementations
  BiosNumToChar -> do
    n <- deNum <$> GetReg Ax
    SetReg Ax (VChar (Char.chr (fromIntegral n)))
  BiosCharToNum -> do
    c <- deChar <$> GetReg Ax
    SetReg Ax (VNum (fromIntegral $ Char.ord c))


-- Shouldn't matter what these specifc address are.
-- TODO: prefer these not o be top level
aFalse,aTrue :: MemAddr
aFalse = MemAddr 10
aTrue = MemAddr 11

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

binV :: (Word16 -> Word16 -> Word16) -> Val -> Val -> Val
binV f v1 v2 =
  case (v1,v2) of
    (VNum n1,VNum n2) -> VNum (f n1 n2)
    _ -> error (show ("subV/unexpected-types",v1,v2))

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

deMemAddr :: String -> Val -> MemAddr
deMemAddr who = \case VMemAddr x -> x; v -> error (show("deMemAddr",who,v))

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

instance Functor M where fmap = liftM
instance Applicative M where pure = Ret; (<*>) = ap
instance Monad M where (>>=) = Bind

----------------------------------------------------------------------
-- Execution monad (emulation!) name X maybe. or Emu. or M is ok!
-- handles state for regs/memory & access to code from the image

data M a where
  Ret :: a -> M a
  Bind :: M a -> (a -> M b) -> M b
  XHalt :: M ()
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

debug :: Show a => a -> Interaction -> Interaction
debug _ i = i -- disabled

data State = State
  { rmap :: Map Reg Val
  , mem :: Map MemAddr Val
  , flagZ :: Bool
  , flagN :: Bool
  , countOps :: Int
  , lastCodeLabel :: CodeLabel
  , offsetFromLastLabel :: Int
  }

instance Show State where
  show State{rmap} =
    intercalate " " [ show k ++ "=" ++ show v | (k,v) <- Map.toList rmap ]

runM :: TraceFlag  -> Image -> M () -> Interaction
runM traceFlag Image{cmap=cmapUser} m = loop state0 m k0
  -- TODO: init mem from vals portion of image -- and compile top/loadable to use it
  where

    trace :: String -> Interaction -> Interaction
    trace = case traceFlag of
      TraceOn -> ITrace
      TraceOff -> \_s i -> i

    cmap = Map.insert finalCodeLabel finalCode cmapUser
      where finalCode = Do (OpCall BiosHalt) (Done Crash)

    finalCodeLabel = CodeLabel 0 "FINAL"

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
        initialStackPointer = MemAddr 0 -- stack address will be negative. TODO: what should it be?
        aFinalCont = MemAddr 12 -- TODO: where? matters not but we need a consistent mem layout
        rmap = Map.fromList
          [ (Sp, VMemAddr initialStackPointer)
          , (Cx, VMemAddr aFinalCont)
          ]
        mem = Map.fromList
          [ (aFalse, VNum tFalse)
          , (aTrue, VNum tTrue)
          , (aFinalCont, VCodeLabel finalCodeLabel)
          , (addAddr 1 aFinalCont, VChar 'X') -- dummy next cont
          ]

    k0 _s () = IDone

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
      XHalt -> IDone

      TraceOp op -> traceOpOJump (show op) s k
      TraceJump jump -> traceOpOJump (show jump) s k

      GetCode lab -> debug ("GetCode",lab) $ do
        k s { lastCodeLabel = lab, offsetFromLastLabel = 0 } (maybe err id $ Map.lookup lab cmap)
        where err = error (show ("runM/GetCode",lab))

      SetReg r v -> debug ("SetReg",r,v) $ do
        k s { rmap = Map.insert r v rmap } ()

      GetReg r -> do
        let v = maybe err id $ Map.lookup r rmap
              where err = error (show ("GetReg/uninitialized",r))
        debug ("GetReg",r, "->",v) $ do
          k s v

      SetMem a v -> debug ("SetMem",a,v) $ do
        k s { mem = Map.insert a v mem } ()

      GetMem a -> do
        let v = maybe err id $ Map.lookup a mem
              where err = error (show ("GetMem/uninitialized",a))
        debug ("GetMem",a,"->",v) $ do
          k s v

      SetFlagZ b -> k s { flagZ = b } ()
      GetFlagZ -> k s flagZ

      SetFlagN b -> k s { flagN = b } ()
      GetFlagN -> k s flagN

      PutChar c -> IPut c (k s ())
      GetChar -> IGet $ \c -> k s c

----------------------------------------------------------------------
-- Compile

compile :: SRC.Loadable -> Transformed
compile x = runAsm (compileLoadable x >>= CutCode "Top")

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
    let ops2 = setLocation loc reg
    doOps (ops1++ops2) <$> compileLoadable body

-- TODO: TopDefs should really really not generate Push instructions. But instead should generate static data structures.
compileTopDef ::String -> SRC.Top -> Asm ([Op],Reg)
compileTopDef who = \case
  SRC.TopLit x -> do
    let (ops,source) = compileLit x
    pure
      (ops ++ [ OpMove Ax source
      ],Ax)
  SRC.TopPrim b xs -> undefined b xs
  SRC.TopLam _x body -> do
    lab <- compileCode body >>= CutCode ("TopLam_"++who)
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

  SRC.LetAlias x y body -> undefined x y body

  SRC.LetAtomic (SRC.Ref _ loc) rhs body -> do

    -- fairly blindly copied from LetTop
    (ops1,reg) <- compileAtomic (show loc) rhs
    let ops2 = setLocation loc reg
    doOps (ops1++ops2) <$> compileCode body

  SRC.PushContinuation pre _post (_x,later) first -> do
    lab <- compileCode later >>= CutCode "Cont"
    let
      ops =
        map OpPush (reverse (map compileRef pre)) ++
        [ OpPush (SReg contReg)
        , OpPush (SLit (VCodeLabel lab))
        , OpMove contReg (SReg Sp)
        ]
    doOps ops <$> compileCode first

  SRC.Case scrut arms -> do
    case arms of
      [] -> undefined -- not allowed by syntax/ocaml-checker
      [arm1] -> undefined arm1 -- TODO: need example for this
      arms -> do
        let s :: Source = compileRef scrut
        ops <- concat <$> sequence
          [do lab <- compileArm s arm >>= CutCode ("Arm"++show i) -- TODO: thread position from "->" syntax
              compileArmBranch s arm lab
          | (i,arm) <- zip [1::Int ..] arms
          ]
        pure $ doOps ops (Done Crash)


compileArmBranch :: Source -> SRC.Arm -> CodeLabel -> Asm [Op]
compileArmBranch s (SRC.ArmTag (Ctag _ n) _ _) lab = do
  pure [ OpMove Ax s
       , OpMove Ax (SMemIndirect Ax)
       , OpCmp Ax (SLit (VNum n))
       , OpBranchFlagZ lab
       ]

compileArm :: Source -> SRC.Arm -> Asm Code
compileArm s (SRC.ArmTag _c__CHECK_ME xs rhs) = do
  ops <- sequence [ compileArmUnpack x i s | (i,x) <- zip [1..] xs ]
  doOps (concat ops) <$> compileCode rhs

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

compileArmUnpack :: SRC.Ref -> Int -> Source -> Asm [Op]
compileArmUnpack (SRC.Ref _ loc) i s = do -- TODO not hit yet
  let reg = Ax
  pure $ [ OpMove reg s
         , OpMove reg (SMemIndirectOffset reg i) -- TODO: so this not tried yet
         ] ++ setLocation loc reg

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


compileFunction :: String -> [SRC.Ref] -> SRC.Code -> Asm ([Op],Reg) -- --> Ax
compileFunction who freeVars body = do
  lab <- compileCode body >>= CutCode ("Func_" ++ who)
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
    , OpCmp Ax s2
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
    , OpCmp Ax s2
    , OpCall BiosMakeBoolFromFlagZ
    ]
  (SRC.LessInt, [s1,s2]) ->
    [ OpMove Ax s1
    , OpCmp Ax s2
    , OpCall BiosMakeBoolFromFlagN
    ]
  (SRC.Explode, [s1]) ->
    [ OpMove Ax s1
    , OpCall BiosExplode
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

setLocation :: SRC.Location -> Reg -> [Op]
setLocation loc reg = case loc of
  SRC.Global n -> [OpStore (globalOffset n) reg]
  SRC.Temp n -> [OpStore (tempOffset n) reg]
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

-- TODO: too many globals will crash into the temps! -- happens for shell example
-- make a quick hack so globals go 101.199, 301.. (leaving a gap for 100 temps)
-- this is just so I dont change the numbers for most example's asm output
-- while I am still checking the evaluation for shell works
-- will have a think and make a proper fix in a mo
globalOffset :: Int -> MemAddr
globalOffset n = MemAddr (globalStart + n + tempHole)
  where globalStart = 100
        tempHole = if n >= 100 then 100 else 0

tempOffset :: Int -> MemAddr
tempOffset n = MemAddr (tempStart + n)
  where tempStart = 200

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
    state0 = AsmState { u = 1 }
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
