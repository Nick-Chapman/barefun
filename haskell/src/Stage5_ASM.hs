-- | Generate x86 assembly
module Stage5_ASM
  ( execute, TraceFlag(..), DebugFlag(..)
  , compile
  ) where

import Builtin (Builtin)
import Control.Exception (assert)
import Control.Monad (ap,liftM)
import Data.Char (ord)
import Data.List (intercalate)
import Data.Map (Map)
import Data.Word (Word16)
import Prelude hiding (Word)
import Stage1_EXP (Ctag(..))
import Text.Printf (printf)
import Value (Interaction(..))
import Value (Number,tTrue,tFalse,tUnit)
import qualified Builtin as SRC (Builtin(..))
import qualified Data.Char as Char (chr,ord)
import qualified Data.Map as Map
import qualified Stage4_CCF as SRC
import qualified Value as I (Tickable(Op,Alloc,GC,Copied))

enableGC :: Bool
enableGC = True

bytesPerWord :: Int
bytesPerWord = 2

twoE16 :: Int
twoE16 = 65536

type Transformed = Image

data Image = Image
  { cmap :: Map CodeLabel Code
  , dmap :: Map DataLabel [DataSpec]
  , start :: CodeLabel
  }

data DataSpec
  = DW [Word]
  | DB [Char] -- TODO: remove? we always use String
  | DS String

data Code
  = Do Op Code
  | Done Jump

data Op -- target; source (Intel Syntax style)
  = OpComment String
  | OpMany [Op]
  | OpMove Reg Source
  | OpStore Target Reg
  | OpCall BareBios
  | OpPush Source
  | OpPushSAVE Source
  | OpPopRESTORE Reg
  | OpCmp Source Source -- the first source can't be [ax] - but [bx] is ok. what are the x86 rules?
  | OpBranchFlagZ CodeLabel
  | OpAddInto Reg Source
  | OpSubInto Reg Source
  | OpMulIntoAx Reg  -- ax := ax * sourceReg
  | OpDivModIntoAxDx Reg -- dx:ax / sourceReg. quotiant->ax, remainder->dx

data Jump
  = JumpDirect CodeLabel
  | JumpReg Reg
  | JumpIndirect Reg

data Target
  = TReg Reg
  | TMem Addr

data Source
  = SReg Reg
  | SLit Word -- TODO: introduce Lit; a reduced version of Word
  | SMem Addr
  | SMemIndirectOffset Reg Int -- byte indexing

vTag :: Ctag -> Word
vTag (Ctag _ n) = WNum n

data Reg = Ax | Bx | Cx | Dx | Sp | Bp | Si | Di
  deriving (Eq,Ord)

data CodeLabel = CodeLabel Int String -- unique label and provenance
  deriving (Eq,Ord)

data DataLabel = DataLabel SRC.Global -- TODO: better a String (normally naming the Global) but subsuming ARuntime
  deriving (Eq,Ord)

-- BareBios; primitive routines available to the compiled code
data BareBios
  -- Base_clear_screen -- TODO: expose to user code
  = Bare_halt
  | Bare_crash
  | Bare_enter_check
  | Bare_put_char
  | Bare_get_char
  | Bare_make_bool_from_z
  | Bare_make_bool_from_n
  | Bare_num_to_char
  | Bare_char_to_num
  | Bare_addr_to_num

  | Bare_make_bytes
  | Bare_set_bytes
  | Bare_get_bytes

  | Bare_load_sector
  | Bare_store_sector

  deriving Show

----------------------------------------------------------------------
-- Show

instance Show Image where
  show Image{cmap,dmap,start} =
    unlines [ printf "%s: ; %s\n%s" (show lab) provenance (show code)
            | (lab@(CodeLabel _ provenance),code) <- Map.toList cmap ]
    ++
    unlines [ printf "%s:%s" (show lab) (concat (map show vals))
            | (lab,vals) <- Map.toList dmap ]
    ++ printf "\nbare_start: jmp %s" (show start)

instance Show DataSpec where
  show = \case
    DW [] -> ""
    DW ws -> printf "\n  dw %s" (intercalate ", " [ show w | w <- ws ])
    DB [] -> ""
    DB cs -> printf "\n  db %s" (intercalate ", " [ printf "`%s`" (escapeCharForNasm c) | c <- cs ])
    DS s -> printf "\n  db `%s`" (concat (map escapeCharForNasm s))

instance Show Code where
  show = \case
    Do op code -> "  " ++ show op ++ "\n" ++ show code
    Done jump -> "  " ++ show jump ++ "\n"

instance Show Op where
  show = \case
    OpComment message ->  ";; " ++ message
    OpMany ops -> intercalate "\n  " (map show ops)
    OpMove r src -> "mov " ++ show r ++ ", " ++ show src
    OpStore target src -> "mov [" ++ show target ++ "], " ++ show src
    OpCall bare -> "call " ++ show bare
    OpPush src -> "push word " ++ show src
    OpPushSAVE src -> "push word " ++ show src ++ " ;; save"
    OpPopRESTORE src -> "pop word " ++ show src ++ " ;; restore"
    OpCmp r src -> "cmp word " ++ show r ++ ", " ++ show src
    OpBranchFlagZ lab ->  "jz " ++ show lab
    OpAddInto r src -> "add " ++ show r ++ ", " ++ show src
    OpSubInto r src -> "sub " ++ show r ++ ", " ++ show src
    OpMulIntoAx src -> "mul " ++ show src
    OpDivModIntoAxDx src -> "div " ++ show src

instance Show Jump where
  show = \case
    JumpDirect c -> "jmp "  ++ show c
    JumpReg r -> "jmp "  ++ show r
    JumpIndirect r -> "jmp ["  ++ show r ++ "]"

instance Show Source where
  show = \case
    SReg r -> show r
    SLit w -> show w
    SMem a -> "["++show a++"]"
    SMemIndirectOffset r n ->
      if n == 0 then printf "[%s]" (show r) else
        printf "[%s+%s]" (show r) (show n)

instance Show Target where
  show = \case
    TReg r -> show r
    TMem a -> show a

-- TODO when Lit is split from Word, we can be sure to always PP in style that nasm wants
instance Show Word where
  show = \case
    WChar c -> printf "`%s`" (escapeCharForNasm c) -- a char(byte) in a word(16bits)
    WCharPair (c,d) -> printf "`%s%s`" (escapeCharForNasm c) (escapeCharForNasm d)
    WNum n -> show n
    WAddr a -> show a
    WCodeLabel lab -> show lab
    WUninitialized m -> printf "[uninitialized:%s]" m
    WBlockDescriptor d -> show d
    WUninitializedCharPair -> printf "[uninitialized-char-pair]"

instance Show BlockDescriptor where
  show = \case
    Scanned n -> show n ++ " ;; scanned"
    RawData n -> show n ++ " ;; raw-data"
    BrokenHeart -> "[broken-heart]"

escapeCharForNasm :: Char -> String
escapeCharForNasm c = do
  let n = ord c
  if c == '\n' then "\\n" else
    if c == '`' then "\\`" else
      if (n < 32 || n > 126) then printf "\\x%02x" n else [c]

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
    AHeapSpace x -> show x
    AStatic d 0 -> printf "%s" (show d)
    AStatic d n -> printf "%s+%d" (show d) n
    ATempSpace (SRC.Temp n) -> printf "Temps+%d" (2*n)
    ARuntime s -> s

instance Show HeapAddr where
  show (HeapAddr x) = "#" ++ show x

instance Show CodeLabel where show (CodeLabel n _) = "L" ++ show n
instance Show DataLabel where show (DataLabel g) = show g

----------------------------------------------------------------------
-- Execute

data TraceFlag = TraceOn | TraceOff
data DebugFlag = DebugOn | DebugOff

execute :: Transformed -> TraceFlag -> DebugFlag -> Interaction
execute i trace debug = runM trace debug i (execImage i)

execImage :: Image -> M ()
execImage Image{start} = GetCode start >>= execCode

execCode :: Code -> M ()
execCode = \case
  Do (OpComment{}) code -> execCode code
  Do (OpMany []) code -> execCode code
  Do (OpMany (op:ops)) code -> execCode $ Do op (Do (OpMany ops) code)
  Do op code -> do
    TraceOp op -- TODO: move to compile time to allow debug on qemu/real-hardware
    execOp op (execCode code)
  Done jump -> do
    TraceJump jump
    execJump jump

execOp :: Op -> M () -> M ()
execOp = \case
  OpComment{} -> error "execOp/OpComment"
  OpMany{} -> error "execOp/OpMany"
  OpMove r s -> \cont -> do w <- evalSource s; SetReg r w; cont
  OpStore t s -> \cont -> do w <- GetReg s; a <- evalTarget t; SetMem a w; cont
  OpCall bare -> \cont -> do execBare bare; cont
  OpPush s -> \cont -> do
    w <- evalSource s
    execPushAlloc I.Alloc w
    cont
  OpPushSAVE s -> \cont -> do
    w <- evalSource s
    execPushSAVE w
    cont
  OpPopRESTORE reg -> \cont -> do
    execPopRESTORE reg
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
  OpAddInto r s -> execBinaryOpInto (+) r s
  OpSubInto r s -> execBinaryOpInto (-) r s
  OpMulIntoAx s -> execBinaryOpInto (*) Ax (SReg s)
  OpDivModIntoAxDx divisorReg -> \cont -> do
    ax <- (fromIntegral . deNum) <$> GetReg Ax
    dx <- (fromIntegral . deNum) <$> GetReg Dx
    let dividend = (dx * twoE16 + ax)
    divisor <- (fromIntegral . deNum) <$> GetReg divisorReg
    SetReg Ax (WNum (fromIntegral (dividend `div` divisor)))
    SetReg Dx (WNum (fromIntegral (dividend `mod` divisor)))
    cont

-- this is called from user code which does OpPush & also from GC when copying
-- it records #bytes allocated (why am I recording in #bytes not #words?)
-- and it does sanity checks for the pushed block-descriptor
execPushAlloc :: I.Tickable -> Word -> M ()
execPushAlloc ticker w = do
  a <- deAddr <$> GetReg Sp
  sequence_ (replicate bytesPerWord (TraceAlloc ticker))
  let a' = addAddr (-(bytesPerWord)) a
  SetMem a' w
  SetReg Sp (WAddr a')
  --Debug (printf "Alloc: %s = %s\n" (show a') (show w))
  checkPushBlockDescriptor w

execPushSAVE :: Word -> M ()
execPushSAVE w = do -- pre decrement
  a <- deAddr <$> GetReg Sp
  let a' = addAddr (-(bytesPerWord)) a
  SetReg Sp (WAddr a')
  SetMem a' w

execPopRESTORE :: Reg -> M ()
execPopRESTORE reg = do -- post increment
  a <- deAddr <$> GetReg Sp
  GetMem a >>= SetReg reg
  let a' = addAddr (bytesPerWord) a
  SetReg Sp (WAddr a')

checkPushBlockDescriptor :: Word -> M ()
checkPushBlockDescriptor = \case
  WBlockDescriptor desc -> do
    let sizeInBytes = case desc of Scanned n -> n; RawData n -> n; BrokenHeart -> error "checkPushBlockDescriptor/BrokenHeart"
    CheckRecentAlloc (sizeInBytes + 2) -- 2 for the block descriptor itself
    pure ()
  _ ->
    pure ()

slideStackPointer :: I.Tickable -> Int -> M ()
slideStackPointer ticker nBytes = do
  sequence_ (replicate (nBytes) (TraceAlloc ticker))
  a <- deAddr <$> GetReg Sp
  let a' = addAddr (-(nBytes)) a
  SetReg Sp (WAddr a')
  let nWords = nBytes `div` 2
  let xs = [ addAddr (bytesPerWord * offset) a' | offset <- [ 0.. nWords -1 ] ]
  sequence_ [ SetMem x WUninitializedCharPair | x <- xs ]

execBinaryOpInto :: (Number -> Number -> Number) -> Reg -> Source -> M () -> M ()
execBinaryOpInto f r s = \cont -> do
    w1 <- GetReg r
    w2 <- evalSource s
    SetReg r (binaryW f w1 w2)
    cont

evalSource :: Source -> M Word
evalSource = \case
  SReg r -> GetReg r
  SLit w -> pure w
  SMem a -> GetMem a
  SMemIndirectOffset r i -> do
    a <- deAddr  <$> GetReg r
    GetMem (addAddr i a)

evalTarget :: Target -> M Addr
evalTarget = \case
  TMem a -> pure a
  TReg r -> deAddr <$> GetReg r

execBare :: BareBios -> M ()
execBare = \case
  Bare_halt -> Halt
  Bare_crash -> Crash

  Bare_enter_check -> do
    _x <- deAddr <$> GetReg Sp
    if not enableGC then pure () else do
      gcTop

  Bare_get_char -> do c <- GetChar; SetReg Ax (WChar c)
  Bare_put_char -> do c <- deChar <$> GetReg Ax; PutChar c

  Bare_make_bool_from_z -> do
    b <- GetFlagZ
    SetReg Ax (WAddr (if b then aTrue else aFalse))
  Bare_make_bool_from_n -> do
    b <- GetFlagN
    SetReg Ax (WAddr (if b then aTrue else aFalse))

  -- On real hardware Num/Char will have overlapping representations
  -- such that ord/chr have null implementations. maybe not quite. the high byte of a char will be zero
  Bare_num_to_char -> do
    n <- deNum <$> GetReg Ax
    SetReg Ax (WChar (Char.chr (fromIntegral n)))
  Bare_char_to_num -> do
    c <- deChar <$> GetReg Ax
    SetReg Ax (WNum (fromIntegral $ Char.ord c))

  -- this is only called by builtin GetStackPointer, to implement "space"
  -- we halve the answer to be sure to get a 15bit answer, i.e. in units of words; not sure why we care.
  Bare_addr_to_num -> do -- TODO: remove this
    a <- deAddr <$> GetReg Ax
    SetReg Ax (WNum (fromIntegral $ halve $ deHeapAddr a))
      where halve (HeapAddr n) = n `div` 2

  Bare_make_bytes -> do
    n <- deNum <$> GetReg Ax
    let numBytes = align (fromIntegral n) where align n = 2 * ((n+1) `div` 2)
    slideStackPointer I.Alloc numBytes
    execPushAlloc I.Alloc (WNum n) -- length word; part of user data
    w <- GetReg Sp
    SetReg Ax w
    let desc = RawData { evenSizeInBytes = fromIntegral numBytes + 2 } -- 2 for the length word
    execPushAlloc I.Alloc (WBlockDescriptor desc) -- size word; part of GC data

  Bare_set_bytes -> do -- TODO: no need for Bare
    a <- deAddr <$> GetReg Ax
    i <- deNum <$> GetReg Si
    c <- deChar <$> GetReg Bx
    let a' = addAddr (fromIntegral i + bytesPerWord) a  -- +bytesPerWord for the length word
    setMemByte a' c

  Bare_get_bytes -> do -- TODO: no need for Bare
    a <- deAddr <$> GetReg Ax
    i <- deNum <$> GetReg Bx
    let a' = addAddr (fromIntegral i + bytesPerWord) a  -- +bytesPerWord for the length word
    c <- getMemByte a'
    SetReg Ax (WChar c)

  Bare_load_sector -> do -- TODO: emulate in Value/Interaction
    pure ()
  Bare_store_sector -> do -- TODO: emulate in Value/Interaction
    pure ()

setMemByte :: Addr -> Char -> M ()
setMemByte a x = do
  --Debug (printf "setB: %s = %s\n" (show a) (show x))
  let even = evenAddr a
  let aligned = (if even then a else addAddr (-1) a)
  w <- GetMem aligned
  let (c,d) = splitWord w
  let w' = WCharPair (if even then (x,d) else (c,x))
  SetMem aligned w'

getMemByte :: Addr -> M Char
getMemByte a = do
  let even = evenAddr a
  let aligned = (if even then a else addAddr (-1) a)
  w <- GetMem aligned
  let (c,d) = splitWord w
  let x = (if even then c else d)
  --Debug (printf "getB: %s -> %s\n" (show a) (show x))
  pure x

splitWord :: Word -> (Char,Char)
splitWord = \case
  WCharPair (c,d) -> (c,d)
  WUninitializedCharPair -> ('\0','\0')
  w -> error (show ("splitWord",w))

execJump :: Jump -> M ()
execJump = \case
  JumpDirect{} -> undefined GetCode -- TODO: remove this if we dont need it
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
deChar = \case
  WChar x -> x
  w -> error (show("deChar",w))

deNum :: Word -> Number
deNum = \case WNum x -> x; w -> error (show("deNum",w))

addAddr :: Int -> Addr -> Addr
addAddr i = \case
  AHeapSpace ha  -> AHeapSpace (addHeapAddr i ha)
  AStatic lab n -> AStatic lab (n+i)
  ATempSpace{} -> undefined -- TODO: this can not happen. more refined rep will fix this
  ARuntime{} -> undefined

addHeapAddr :: Int -> HeapAddr -> HeapAddr
addHeapAddr i (HeapAddr n) = mkHeapAddr (fromIntegral (n + fromIntegral i))

----------------------------------------------------------------------
-- Execution monad (emulation!)

instance Functor M where fmap = liftM
instance Applicative M where pure = Ret; (<*>) = ap
instance Monad M where (>>=) = Bind

data M a where
  Ret :: a -> M a
  Bind :: M a -> (a -> M b) -> M b
  Halt :: M ()
  Crash :: M ()
  CheckRecentAlloc :: Int -> M ()
  Debug :: String -> M ()
  Debug1 :: String -> M ()
  TraceOp :: Op -> M ()
  TraceJump :: Jump -> M ()
  TraceAlloc :: I.Tickable -> M ()
  GetCode :: CodeLabel -> M Code
  SetReg :: Reg -> Word -> M () -- TODO: SetReg/GetReg will operate on Val
  GetReg :: Reg -> M Word
  SetMem :: Addr -> Word -> M ()
  GetMem :: Addr -> M Word
  SetFlagZ :: Bool -> M ()
  GetFlagZ :: M Bool
  SetFlagN :: Bool -> M ()
  GetFlagN :: M Bool
  PutChar :: Char -> M ()
  GetChar :: M Char
  BumpGC :: M Int

runM :: TraceFlag -> DebugFlag -> Image -> M () -> Interaction
runM traceFlag debugFlag Image{cmap=cmapUser,dmap} m = loop stateLoaded m k0

  where

    stateLoaded = state0 dmap

    k0 _s () = IDone

    cmap = Map.insert finalCodeLabel finalCode cmapUser
    finalCode = Do (OpCall Bare_halt) (error "finalCode;will have halterd")

    trace :: String -> Interaction -> Interaction
    trace = case traceFlag of
      TraceOn -> ITrace
      TraceOff -> \_s i -> i

    debug = case debugFlag of
      DebugOn -> ITrace
      DebugOff -> \_s i -> i

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
    loop s@State{rmap,mem,flagZ,flagN,gcNum} m k = case m of

      Ret x -> k s x
      Bind m f -> loop s m $ \s a -> loop s (f a) k
      Halt -> IDone
      Crash -> ITrace "[Crash]\n" $ IDone

      CheckRecentAlloc expect -> do
        let State{allocsSinceLastCheck=actual} = s
        let same = (expect == actual)
        let m = printf "CheckRecentAlloc: expect=%d, actual=%d, same=%s\n" expect actual (show same)
        if not same then error m else
            k s { allocsSinceLastCheck = 0 } ()

      Debug m -> debug m $ k s ()
      Debug1 m -> ITrace m $ k s ()

      TraceOp op -> traceOpOJump (show op) s k
      TraceJump jump -> traceOpOJump (show jump) s k

      TraceAlloc ticker -> do
        let State{allocsSinceLastCheck} = s
        ITick ticker $ k s { allocsSinceLastCheck = 1 + allocsSinceLastCheck } ()

      GetCode lab -> do
        k s { lastCodeLabel = lab, offsetFromLastLabel = 0 } (maybe err id $ Map.lookup lab cmap)
        where err = error (show ("runM/GetCode",lab))

      SetReg r w -> do
        checkAlignedSp r w $
          k s { rmap = Map.insert r w rmap } ()

      GetReg r -> k s (maybe err id $ Map.lookup r rmap)
        where err = WUninitialized $ show ("GetReg/uninitialized",r)

      SetMem a w -> do
        if not (evenAddr a) then error (printf "SetMem(odd): %s" (show a)) else
          k s { mem = Map.insert a w mem } ()
      GetMem a -> do
        if not (evenAddr a) then error (printf "GetMem(odd): %s" (show a)) else
          k s (maybe err id $ Map.lookup a mem)
          where err = WUninitialized $ show ("GetMem/uninitialized",a)

      SetFlagZ b -> k s { flagZ = b } ()
      GetFlagZ -> k s flagZ

      SetFlagN b -> k s { flagN = b } ()
      GetFlagN -> k s flagN

      PutChar c -> IPut c (k s ())
      GetChar -> IGet $ \c -> k s c

      BumpGC -> do
        ITick I.GC $
          k s { gcNum = gcNum + 1 } gcNum

checkAlignedSp :: Reg -> Word -> Interaction -> Interaction
checkAlignedSp = \case
  Sp -> \case
    -- TODO: subsume with check that all heap addresses are aligned
    WAddr (AHeapSpace (HeapAddr n)) ->
      if n `mod` 2 == 1 then error (show ("unaligned Sp",n)) else
        \i -> i
    w -> error (show ("trying to set Sp to a non address",w))
  _ ->
    \_ i -> i

data State = State
  { rmap :: Map Reg Word
  , mem :: Map Addr Word
  , flagZ :: Bool
  , flagN :: Bool
  , countOps :: Int
  , lastCodeLabel :: CodeLabel
  , offsetFromLastLabel :: Int
  , allocsSinceLastCheck :: Int
  , gcNum :: Int
  }

state0 :: Map DataLabel [DataSpec] -> State
state0 dmap = State
  { mem
  , rmap
  , flagZ = error "flagZ/uninitialized"
  , flagN = error "flagN/uninitialized"
  , countOps = 0
  , lastCodeLabel = error "lastCodeLabel"
  , offsetFromLastLabel = error "offsetFromLastLabel"
  , allocsSinceLastCheck = 0
  , gcNum = 1
  }
  where
    initialStackPointer = AHeapSpace (mkHeapAddr topA)
    rmap = Map.fromList
      [ (Sp, WAddr initialStackPointer)
      , (Cx, WAddr aFinalCont)
      ]
    mem = Map.fromList (internal ++ user)

    internal =
      [ (aFalse, vTag tFalse)
      , (aTrue, vTag tTrue)
      , (aUnit, vTag tUnit)
      , (aFinalCont, WCodeLabel finalCodeLabel)
      ]
    user =
      concat [ [(AStatic lab i,w) | (i,w) <- specsWords 0 specs ]
             | (lab,specs) <- Map.toList dmap
             ]

specsWords :: Int -> [DataSpec] -> [(Int,Word)]   -- TODO: clean up this mess!
specsWords offset = \case
  [] -> []
  DW ws : specs ->
    [ (offset + (2*i), w) | (i,w) <- zip [0..] ws ] ++ specsWords (offset + 2 * length ws) specs
  {-DB cs : specs ->
    [ (offset + i, WChar c) | (i,c) <- zip [0..] cs ] ++ specsWords (offset + length cs) specs
  DS s : specs ->
    [ (offset + i, WChar c) | (i,c) <- zip [0..] s ] ++ specsWords (offset + length s) specs-}
  DB{} : _ -> undefined
  DS{} : (_:_) -> undefined
  [DS s] -> [ (offset + (2*i), WCharPair (c,d)) | (i,(c,d)) <- zip [0..] (pairUp s) ]
  where
    pairUp :: [Char] -> [(Char,Char)]
    pairUp = \case
      [] -> []
      a:b:xs -> (a,b):pairUp xs
      [a] -> [(a,'\0')]

instance Show State where
  show State{rmap} =
    intercalate " " [ show k ++ "=" ++ show w | (k,w) <- Map.toList rmap ]

aFalse,aTrue,aUnit,aFinalCont :: Addr
aFalse = AStatic (DataLabel (SRC.Global (-1))) 0
aTrue = AStatic (DataLabel (SRC.Global (-2))) 0
aFinalCont = AStatic (DataLabel (SRC.Global (-4))) 0

aUnit = ARuntime "Bare_unit"

finalCodeLabel :: CodeLabel
finalCodeLabel = CodeLabel 0 "FINAL"

----------------------------------------------------------------------
-- Compile

-- Calling conventions:
frameReg,argReg,contReg :: Reg
frameReg = Bp
argReg = Dx
contReg = Cx

-- Use S1/Di for first couple of temps
targetOfTemp :: SRC.Temp -> Target
targetOfTemp = \case
  SRC.Temp 0 -> error "targetOfTemp/temps start from 1"
  SRC.Temp 1 -> TReg Si
  SRC.Temp 2 -> TReg Di
  temp -> TMem (ATempSpace temp)

-- Ax is the general scratch register
-- Bx is used for case-scrutinee and temp for simultaneousMove

compile :: SRC.Image -> Transformed
compile x = runAsm (compileImage x >>= CutCode "Start")

compileImage :: SRC.Image -> Asm Code
compileImage = \case
  SRC.Run code -> compileCode code
  SRC.LetTop (id,global) rhs body -> do
    let who = show (id,global)
    vals <- compileTopDef who rhs
    CutData (DataLabel global) vals
    compileImage body

compileTopDef :: String -> SRC.Top -> Asm [DataSpec]
compileTopDef who = \case
  SRC.TopPrim b xs -> undefined b xs -- TODO: provoke or remove
  SRC.TopLitS string -> pure (DW [ WNum (fromIntegral $ length string) ] : [ DS string ])

  SRC.TopLam _x body -> do
    codeLabel <- compileCode body >>= CutCode ("Function: " ++ who)
    let w1 = WCodeLabel codeLabel
    pure [DW [w1]]

  SRC.TopConApp (Ctag _ tag) xs -> do
    pure [DW (WNum tag : map compileTopRef xs)]

compileTopRef :: SRC.Ref -> Word
compileTopRef = \case
    SRC.RefLitC c -> WChar c
    SRC.RefLitN n -> WNum n
    SRC.Ref _ loc -> do
    case loc of
      SRC.InGlobal g -> WAddr (AStatic (DataLabel g) 0)
      _ -> error "compileTopRef"

cutCode :: String -> Code -> Asm CodeLabel
cutCode name code = do
  CutCode name $ do
    doOps [ OpCall Bare_enter_check ] code

compileCode :: SRC.Code -> Asm Code
compileCode = \case
  SRC.Return _pos res -> do
    pure $ doOps
      [ OpMove argReg (compileRef res)
      , OpMove frameReg (SReg contReg)
      , OpMove contReg (SMemIndirectOffset frameReg bytesPerWord)
      ] (Done (JumpIndirect frameReg))

  SRC.Tail fun _pos arg -> do
    pure $ doOps (
      simultaneousMove (frameReg,compileRef fun) (argReg,compileRef arg)
      ) (Done (JumpIndirect frameReg))

  SRC.LetAtomic (id,temp) rhs body -> do
    let who = show (id,temp)
    let target = targetOfTemp temp
    ops <- compileAtomicTo who target rhs
    doOps ops <$> compileCode body

  SRC.PushContinuation pre _post (_x,later) first -> do
    lab <- compileCode later >>= cutCode "Continuation"
    let
      desc = Scanned { evenSizeInBytes = 2 * (length pre + 2) }
    let
      ops =
        map OpPush (reverse (map compileRef pre)) ++
        [ OpPush (SReg contReg)
        , OpPush (SLit (WCodeLabel lab))
        , OpMove contReg (SReg Sp)
        , OpPush (SLit (WBlockDescriptor desc)) -- pushed *after* Sp is read
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
  pure [ OpCmp (SMemIndirectOffset scrutReg 0) (SLit (WNum n))
       , OpBranchFlagZ lab
       ]

compileArmTaken :: Reg -> SRC.Arm -> Asm Code
compileArmTaken scrutReg arm =  do
  let (SRC.ArmTag _pos _tag xs rhs) = arm
  doOps
    [ setTarget (targetOfTemp temp) (SMemIndirectOffset scrutReg (bytesPerWord * i))
    | (i,(_,temp)) <- zip [1..] xs
    ] <$> compileCode rhs

simultaneousMove :: (Reg,Source) -> (Reg,Source) -> [Op]
simultaneousMove (r1,s1) (r2,s2) = do
  let tempReg = Bx
  let op1 = OpMove r1 s1
  let op2 = OpMove r2 s2
  let oneTwo = needs r2 s1
  let twoOne = needs r1 s2
  case (oneTwo,twoOne) of
    (True,True) ->
      [ OpMove tempReg (SReg r1)
      , OpMove r1 s1
      , OpMove r2 (changeRegInSource r1 tempReg s2)
      ]
    (True,_) -> [op1,op2]
    (_,True) -> [op2,op1]
    (False,False) -> [op1,op2] -- either order will do

needs :: Reg -> Source -> Bool
needs r2 = \case
  SReg r -> (r==r2)
  SLit{} -> False
  SMem{} -> False
  SMemIndirectOffset r _ -> (r==r2)

changeRegInSource :: Reg -> Reg -> Source -> Source
changeRegInSource r1 r2 = \case
  SReg r -> SReg (if r==r1 then r2 else r1)
  s@SLit{} -> s
  s@SMem{} -> s
  SMemIndirectOffset r i -> SMemIndirectOffset (if r==r1 then r2 else r1) i

compileAtomicTo :: String -> Target -> SRC.Atomic -> Asm [Op]
compileAtomicTo who target = \case
  SRC.Prim b xs -> pure (compileBuiltinTo target b (map compileRef xs))
  SRC.ConApp (Ctag _ tag) xs -> pure (compileConAppTo target tag xs)
  SRC.Lam pre _post _x body -> compileFunctionTo who target pre body
  SRC.RecLam pre _post _f _x body -> compileFunctionTo who target pre body

compileConAppTo :: Target -> Number -> [SRC.Ref] -> [Op]
compileConAppTo target tag xs = do
  let desc = Scanned { evenSizeInBytes = 2 * (length xs + 1) }
  map OpPush (reverse (SLit (WNum tag) : map compileRef xs)) ++
    [ setTarget target (SReg Sp)
    , OpPush (SLit (WBlockDescriptor desc)) -- pushed *after* Sp is read
    ]

compileFunctionTo :: String -> Target -> [SRC.Ref] -> SRC.Code -> Asm [Op]
compileFunctionTo who target freeVars body = do
  lab <- compileCode body >>= CutCode ("Function: " ++ who)
  let desc = Scanned { evenSizeInBytes = 2 * (length freeVars + 1) }
  pure (
    map OpPush (reverse (map compileRef freeVars)) ++
    [ OpPush (SLit (WCodeLabel lab))
    , setTarget target (SReg Sp)
    , OpPush (SLit (WBlockDescriptor desc)) -- pushed *after* Sp is read
    ])

-- if a builtin returns unit, it may omit assigning the target
-- because nothing will inspect that target. TODO: Is this true?? -- NO IT IS NOT
-- hmm, maybe this is breakaing GC... YES WAS. FIX PutChar.. return unit
-- so it seems that prob was in the "better" put_char
-- which in one branch just disptched to the underlying putchar, returning what it did
-- but this meanit set dx (the arg/return reg) to a Temp which hadn't been set.
-- making the fix below... (***) made it work.
-- think this needs to be in all arms which return unit -- ok, just a few more.. all fixed now.


compileBuiltinTo :: Target -> Builtin -> [Source] -> [Op]
compileBuiltinTo target b = case b of
  SRC.GetChar -> oneArg $ \_ ->
    [ OpCall Bare_get_char
    , setTarget target (SReg Ax)
    ]
  SRC.PutChar -> oneArg $ \s1 ->
    [ OpMove Ax s1
    , OpCall Bare_put_char
    , setTarget target (SLit (WAddr aUnit)) -- TODO: does this make things better? (***)
    ]
  SRC.EqChar -> twoArgs $ \s1 s2 ->
    [ OpMove Ax s1
    , OpCmp (SReg Ax) s2
    , OpCall Bare_make_bool_from_z
    , setTarget target (SReg Ax)
    ]
  SRC.AddInt -> twoArgs $ \s1 s2 ->
    [ OpMove Ax s1
    , OpAddInto Ax s2
    , setTarget target (SReg Ax)
    ]
  SRC.SubInt -> twoArgs $ \s1 s2 ->
    [ OpMove Ax s1
    , OpSubInto Ax s2
    , setTarget target (SReg Ax)
    ]
  SRC.MulInt -> twoArgs $ \s1 s2 ->
    [ OpMove Ax s1 ] ++
    case s2 of
      SReg s2Reg ->
        [ OpMulIntoAx s2Reg
        , setTarget target (SReg Ax)
        ]
      _ ->
        [ OpMove Bx s2
        , OpMulIntoAx Bx
        , setTarget target (SReg Ax)
        ]
  SRC.DivInt -> twoArgs $ \s1 s2 ->
    [ OpMove Ax s1
    , OpMove Bx s2
    , OpPushSAVE (SReg Dx)
    , OpMove Dx (SLit (WNum 0))
    , OpDivModIntoAxDx Bx
    -- quotiant already in Ax
    , OpPopRESTORE Dx
    , setTarget target (SReg Ax)
    ]
  SRC.ModInt -> twoArgs $ \s1 s2 ->
    [ OpMove Ax s1
    , OpMove Bx s2
    , OpPushSAVE (SReg Dx)
    , OpMove Dx (SLit (WNum 0))
    , OpDivModIntoAxDx Bx
    -- remainder in Dx
    , setTarget target (SReg Dx)
    , OpPopRESTORE Dx
    ]
  SRC.EqInt -> twoArgs $ \s1 s2 ->
    [ OpMove Ax s1
    , OpCmp (SReg Ax) s2
    , OpCall Bare_make_bool_from_z -- TODO: maybe remove/inline?
    , setTarget target (SReg Ax)
    ]
  SRC.LessInt -> twoArgs $ \s1 s2 ->
    [ OpMove Ax s1
    , OpCmp (SReg Ax) s2
    , OpCall Bare_make_bool_from_n -- TODO: maybe remove/inline?
    , setTarget target (SReg Ax)
    ]
  SRC.CharChr -> oneArg $ \s1 ->
    [ OpMove Ax s1
    , OpCall Bare_num_to_char -- TODO: remove/inline
    , setTarget target (SReg Ax)
    ]
  SRC.CharOrd -> oneArg $ \s1 ->
    [ OpMove Ax s1
    , OpCall Bare_char_to_num -- TODO: remove/inline
    , setTarget target (SReg Ax)
    ]
  SRC.MakeRef -> oneArg $ \s1 ->
    let desc = Scanned { evenSizeInBytes = 2 } in
    [ OpPush s1
    , setTarget target (SReg Sp)
    , OpPush (SLit (WBlockDescriptor desc)) -- pushed *after* Sp is read
    ]
  SRC.DeRef -> oneArg $ \s1 ->
    [ OpMove Bx s1
    , setTarget target (SMemIndirectOffset Bx 0)
    ]
  SRC.SetRef -> twoArgs $ \s1 s2 ->
    [ OpMove Bx s1
    , OpMove Ax s2
    , OpStore (TReg Bx) Ax
    , setTarget target (SLit (WAddr aUnit))
    ]
  SRC.MakeBytes -> oneArg $ \s1 ->
    [ OpMove Ax s1
    , OpCall Bare_make_bytes
    , setTarget target (SReg Ax)
    ]
  SRC.SetBytes -> threeArgs $ \s1 s2 s3 ->
    [ OpMove Ax s1
    , OpMove Bx s3
    , OpPushSAVE (SReg Si)
    , OpMove Si s2
    , OpCall Bare_set_bytes -- TODO: remove/inline
    , OpPopRESTORE Si
    , setTarget target (SLit (WAddr aUnit))
    ]
  SRC.GetBytes -> twoArgs $ \s1 s2 ->
    [ OpMove Ax s1
    , OpMove Bx s2
    , OpCall Bare_get_bytes -- TODO: remove/inline
    , setTarget target (SReg Ax)
    ]
  SRC.StringIndex -> twoArgs $ \s1 s2 ->
    -- same as SRC.GetBytes; bytes/string have the same rep. -- TODO: share common code
    [ OpMove Ax s1
    , OpMove Bx s2
    , OpCall Bare_get_bytes -- TODO: remove/inline
    , setTarget target (SReg Ax)
    ]
  SRC.FreezeBytes -> oneArg $ \s1 ->
    -- null-imp; bytes/string have the same representation
    [ setTarget target s1
    ]
  SRC.ThawBytes -> oneArg $ \s1 ->
    -- null-imp; bytes/string have the same representation
    [ setTarget target s1
    ]
  SRC.StringLength -> oneArg $ \s1 ->
    [ OpMove Bx s1
    , setTarget target (SMemIndirectOffset Bx 0)
    ]
  SRC.Crash -> oneArg $ \_ ->
    [ OpCall Bare_crash
    ]
  SRC.LoadSec -> twoArgs $ \s1 s2 ->
    [ OpMove Ax s1
    , OpMove Bx s2
    , OpCall Bare_load_sector
    , setTarget target (SLit (WAddr aUnit))
    ]
  SRC.StoreSec -> twoArgs $ \s1 s2 ->
    [ OpMove Ax s1
    , OpMove Bx s2
    , OpCall Bare_store_sector
    , setTarget target (SLit (WAddr aUnit))
    ]
  SRC.GetStackPointer -> oneArg $ \_ -> -- TODO: replace with builtin to discover #live-words
    [ OpMove Ax (SReg Sp)
    , OpCall Bare_addr_to_num
    , setTarget target (SReg Ax)
    ]

  where
    err = error (printf "Stage5.compileBuiltin: error: %s" (show b))
    oneArg f = \case [v] -> f v; _ -> err
    twoArgs f = \case [v1,v2] -> f v1 v2; _ -> err
    threeArgs f = \case [v1,v2,v3] -> f v1 v2 v3; _ -> err

setTarget :: Target -> Source -> Op
setTarget = \case
  TReg target -> \source -> OpMove target source
  TMem targetAddr -> \case
    SReg sourceReg -> OpStore (TMem targetAddr) sourceReg
    source ->
      OpMany  [ OpMove Ax source
              , OpStore (TMem targetAddr) Ax
              ]

compileRef :: SRC.Ref -> Source
compileRef = \case
    SRC.RefLitC c -> SLit (WChar c)
    SRC.RefLitN n -> SLit (WNum n)
    SRC.Ref _ loc -> do
    case loc of
      SRC.InGlobal g -> SLit (WAddr (AStatic (DataLabel g) 0))
      SRC.InFrame n -> SMemIndirectOffset frameReg (bytesPerWord * n)
      SRC.InTemp temp -> sourceOfTarget (targetOfTemp temp)
      SRC.TheArg -> SReg argReg
      SRC.TheFrame -> SReg frameReg

sourceOfTarget :: Target -> Source
sourceOfTarget = \case
  TReg r -> SReg r
  TMem a -> SMem a

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
  CutData :: DataLabel -> [DataSpec] -> Asm ()

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
      CutData lab vals -> \k -> do
        let image@Image{dmap} = k s ()
        image { dmap = Map.insert lab vals dmap }

data AsmState = AsmState { u :: Int }

----------------------------------------------------------------------
-- Runtime rep (moved from higher in file)

-- Word is a structured type for the contents of a memory location
-- We use a variant type to help catch compiler bugs during dev.
-- On a real system, the representations will overlap.
-- Tagging will distinguish pointer from non-pointer.

-- WChar, VNum, VAddr -- Representation of user Values. Things that user code can compute with.
-- WCodeLabel -- Found only in slot 0 of a continuation/closure frame.
-- WBlockDescriptor -- Found only in slot -1 of all heap block.

-- TODO: distinuish type for "Val" (what a register can hold) from "Word" (what can be in a memory cell)
data Word
  = WChar Char
  | WCharPair (Char,Char)
  | WNum Number
  | WAddr Addr
  | WCodeLabel CodeLabel
  | WUninitialized String
  | WBlockDescriptor BlockDescriptor
  | WUninitializedCharPair
  deriving Eq

-- Of the 3 kinds of Addr. Only AHeapSpace and AStatic represent user values
-- The ATempSpace is more like a register, in that it is a location for values.
-- (Perhaps the types could be improved to make this clearer)

data Addr -- memory address
  = AHeapSpace HeapAddr
  | AStatic DataLabel Int -- This int is an offset at the data-label
  | ARuntime String -- TOOD: remove when DataLabel is allows any name
  | ATempSpace SRC.Temp
  deriving (Eq,Ord)

data HeapAddr = HeapAddr Word16
  deriving (Eq,Ord)

data BlockDescriptor -- TODO improve rep, have one variant with size field + scan/raw flag
  = Scanned { evenSizeInBytes :: Int }
  | RawData { evenSizeInBytes :: Int }
  | BrokenHeart
  deriving Eq

deHeapAddr :: Addr -> HeapAddr
deHeapAddr = \case
  AHeapSpace ha -> ha
  AStatic{} -> error "deHeapAddr/AStatic"
  ATempSpace{} -> error "deHeapAddr/ATempSpace"
  ARuntime{} -> error "deHeapAddr/ARuntime"

evenAddr :: Addr -> Bool
evenAddr = \case
  AHeapSpace (HeapAddr n) -> (n `mod` 2) == 0
  AStatic _ offset -> (offset `mod` 2) == 0
  ATempSpace{} -> True
  ARuntime{} -> True

----------------------------------------------------------------------
-- GC

data Hemi = HemiA | HemiB
  deriving Show

otherHemi :: Hemi -> Hemi
otherHemi = \case HemiA -> HemiB; HemiB -> HemiA

-- During dev, we can have quite small heap spaces
-- experimentation shows the sham example needs more that 2000; but 3000 seems enough
heapSizeInBytes :: Int
heapSizeInBytes = 3000

topA,botA,topB,botB :: Int
topA = 50000
botA = topA - heapSizeInBytes
topB = 40000
botB = topB - heapSizeInBytes

topOfHemi :: Hemi -> Int
topOfHemi = \case HemiA -> topA; HemiB -> topB

inA,inB :: Int -> Bool
inA n = n <= topA && n >= botA
inB n = n <= topB && n >= botB

-- Invariant: The Sp will always be a HeapAddr
getSP :: M HeapAddr
getSP = (deHeapAddr . deAddr) <$> GetReg Sp

mkHeapAddr :: Int -> HeapAddr -- TODO: return in Monad(M) so can check we are allocating the correct Hemi
mkHeapAddr n =
  if not (inA n || inB n) then error (printf "mkHeapAddr: %d" n) else
    HeapAddr (fromIntegral n)

whatHemi :: M Hemi
whatHemi = do
  ha <- getSP
  let HeapAddr w16 = ha
  let n = fromIntegral w16
  if inA n then pure HemiA else
    if inB n then pure HemiB else
      error (printf "whatHemi: %d is in neither\n" n)

setHemi :: Hemi -> M ()
setHemi hemi = SetReg Sp (WAddr (AHeapSpace (mkHeapAddr (topOfHemi hemi))))

gcTop :: M ()
gcTop = do

  gcNum <- BumpGC

  fromSpace <- whatHemi
  let toSpace = otherHemi fromSpace

  sp <- getSP
  Debug (printf "GC(%d): %s --> %s (sp=%s)\n" gcNum (show fromSpace) (show toSpace) (show sp))
  --Debug1 (printf "GC(%d)\n" gcNum)
  --Debug1 "{"
  setHemi toSpace

  let roots = [frameReg,argReg,contReg]
  watermark0 <- getSP
  mapM_ evacuateReg roots

  let
    loop :: Int -> HeapAddr -> M ()
    loop step watermark = do
      sp <- getSP
      --Debug (printf "loop(%d.%d): SP=%s < WM=%s\n" gcNum step (show sp) (show watermark))
      let finished = assert (sp <= watermark) (sp == watermark)
      case finished of
        True -> pure ()
        False -> do
          nextWM <- getSP

          let
            scanLoop :: Int -> HeapAddr -> M ()
            scanLoop substep scanPointer = do
              --Debug (printf "inner(%d.%d.%d): scan=%s < watermark=%s\n" gcNum step substep (show scanPointer) (show watermark))
              let finishedScan = assert (scanPointer <= watermark) (scanPointer == watermark)
              case finishedScan of
                True -> do
                  pure ()
                False -> do
                  nextScanPointer <- scavenge scanPointer
                  scanLoop (substep+1) nextScanPointer

          scanLoop 1 nextWM
          loop (step+1) nextWM
          pure ()

  loop 1 watermark0

  HeapAddr x :: HeapAddr <- getSP
  let HeapAddr y :: HeapAddr = mkHeapAddr (topOfHemi toSpace)
  let liveBytes = y - x

  Debug (printf "GC(%d): DONE: liveBytes=%d\n" gcNum liveBytes)
  --Debug1 (printf "%d}" liveBytes)
  pure ()

evacuateReg :: Reg -> M ()
evacuateReg reg = do
  --Debug1 (printf "evacuateReg: %s\n" (show reg))
  w <- GetReg reg
  evacuate w >>= \case
    Just w' -> SetReg reg w'
    Nothing -> pure ()

scavenge :: HeapAddr -> M HeapAddr
scavenge scanPointer = do
  desc <- getBlockDescriptor "for-scavenge" scanPointer
  let
    (sizeWords,mustScan) =
      case desc of
        Scanned n -> (n `div` 2, True)
        RawData n -> (n `div` 2, False)
        BrokenHeart -> error "scavenge/BrokenHeart"

  case mustScan of
    True -> do
      -- 1..size because we are pointing at descriptor
      let xs = [ addHeapAddr (bytesPerWord * offset) scanPointer | offset <- [ 1 .. sizeWords ] ]
      mapM_ scavengeHA xs
      pure ()
    False -> pure ()

  let nextScanPointer = addHeapAddr (bytesPerWord * (sizeWords+1)) scanPointer
  pure nextScanPointer

scavengeHA :: HeapAddr -> M ()
scavengeHA ha = do
  w <- GetMem (AHeapSpace ha)
  evacuate w >>= \case
    Just w' -> SetMem (AHeapSpace ha) w'
      --Debug (printf "scavengeHA: %s : %s --> %s\n" (show ha) (show w) (show w'))
    Nothing -> do
      --Debug (printf "scavengeHA: %s : unmoved\n" (show ha))
      pure ()

evacuate :: Word -> M (Maybe Word)
evacuate w = do
  --Debug (printf "evacuate: %s\n" (show w))
  case w of
    WAddr (AHeapSpace ha) -> (Just . WAddr . AHeapSpace) <$> evacuateHA ha
    _ -> pure Nothing

evacuateHA :: HeapAddr -> M HeapAddr
evacuateHA objectA = do
  let descA = addHeapAddr (-bytesPerWord) objectA
  --Debug (printf "evacuateHA: objectA=%s, descA=%s\n" (show objectA) (show descA))
  desc <- getBlockDescriptor "for-evacuate" descA
  let sizeBytesMaybe = (case desc of Scanned n -> Just n; RawData n -> Just n; BrokenHeart -> Nothing)
  case sizeBytesMaybe of
    Just sizeBytes -> do
      let sizeWords = sizeBytes `div` 2
      let xs = reverse [ addHeapAddr (bytesPerWord * offset) objectA | offset <- [ -1 .. sizeWords-1 ] ]
      mapM_ copyAlloc xs
      sp <- getSP
      let relocatedA = addHeapAddr bytesPerWord sp -- point one word past the new desc
      -- overwrite original object with broken Heart; which points tothe relocated object
      SetMem (AHeapSpace descA) (WBlockDescriptor BrokenHeart)
      SetMem (AHeapSpace objectA) (WAddr (AHeapSpace relocatedA))
      pure relocatedA

    Nothing -> do -- BrokenHeart
      -- return the indirected previously copied object
      (deHeapAddr . deAddr)  <$> GetMem (AHeapSpace objectA)

copyAlloc :: HeapAddr -> M ()
copyAlloc ha = do
  w <- GetMem (AHeapSpace ha)
  execPushAlloc I.Copied w
  --_newAddress <- getSP
  --Debug (printf "copyAlloc: %s --> (%s) --> %s\n" (show ha) (show w) (show _newAddress))
  pure ()

getBlockDescriptor :: String -> HeapAddr -> M BlockDescriptor
getBlockDescriptor who ha = do
  w <- GetMem (AHeapSpace ha)
  case w of
    WBlockDescriptor d -> pure d
    w ->
      error (printf "getBlockDescriptor(%s): not a block-descriptor: %s at %s"
              who (show w) (show ha))
