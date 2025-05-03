-- | Emulate Stage5(ASM) as x86
module Stage5_ASM_Emulation
  ( execute, TraceFlag(..), DebugFlag(..)
  ) where

import Control.Exception (assert)
import Control.Monad (ap,liftM)
import Data.List (intercalate)
import Data.Map (Map)
import Data.Word (Word16)
import Prelude hiding (Word)
import Stage1_EXP (Ctag(..))
import Text.Printf (printf)
import Value (Interaction(..))
import Value (Number,tTrue,tFalse,tUnit)
import qualified Data.Char as Char (chr,ord)
import qualified Data.Map as Map
import qualified Stage4_CCF as SRC
import qualified Value as I (Tickable(Op,Alloc,GC,Copied))

import Stage5_ASM_AbstractSyntax

gcLiveWordsTrace :: Bool
gcLiveWordsTrace = False

-- During dev, we can have quite small heap spaces
-- experimentation shows the sham example needs more that 2000; but 3000 seems enough
hemiSizeInBytes :: Int
hemiSizeInBytes = 3000

topA,botA,topB,botB :: Int
topA = twoE16 - 2 -- waste two bytes at the top of memory to avoid topA from being 0
botA = topA - hemiSizeInBytes

topB = botA
botB = topB - hemiSizeInBytes

twoE16 :: Int
twoE16 = 256 * 256

----------------------------------------------------------------------
-- Execute

type Transformed = Image

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
    execPushAlloc AllocForUser w
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
  OpEnterCheck need -> \cont -> do
    n <- heapBytesRemaining
    if (n < need) then gcTop else pure ()
    n <- heapBytesRemaining
    if (n < need)
      then do Print (printf "[Not enough space recovered by GC: need=%d; have:%d]\n" need n); Crash
      else
      do
        Debug (printf "BudgedForAllocation: %d\n" need)
        BudgedForAllocation need
        cont

-- this is called from user code which does OpPush & also from GC when copying
-- it records #bytes allocated (why am I recording in #bytes not #words?)
-- and it does sanity checks for the pushed block-descriptor
execPushAlloc :: AllocMode -> Word -> M ()
execPushAlloc mode w = do
  a <- deAddr <$> GetReg Sp
  a' <- addAddr (-(bytesPerWord)) a
  SetMem a' w
  SetReg Sp (WAddr a')
  Debug (printf "Alloc: %s = %s\n" (show a') (show w))
  sequence_ (replicate bytesPerWord (TraceAlloc mode))
  checkPushBlockDescriptor w

execPushSAVE :: Word -> M ()
execPushSAVE w = do -- pre decrement
  a <- deAddr <$> GetReg Sp
  a' <- addAddr (-(bytesPerWord)) a
  SetReg Sp (WAddr a')
  SetMem a' w

execPopRESTORE :: Reg -> M ()
execPopRESTORE reg = do -- post increment
  a <- deAddr <$> GetReg Sp
  GetMem a >>= SetReg reg
  a' <- addAddr (bytesPerWord) a
  SetReg Sp (WAddr a')

checkPushBlockDescriptor :: Word -> M ()
checkPushBlockDescriptor = \case
  WBlockDescriptor desc -> do
    let sizeInBytes = case desc of Scanned n -> n; RawData n -> n
    CheckRecentAlloc (sizeInBytes + 2) -- 2 for the block descriptor itself
    pure ()
  _ ->
    pure ()

slideStackPointer :: AllocMode -> Int -> M ()
slideStackPointer mode nBytes = do
  Debug (printf "SLIDE: %d\n" nBytes)
  sequence_ (replicate (nBytes) (TraceAlloc mode))
  a <- deAddr <$> GetReg Sp
  a' <- addAddr (-(nBytes)) a
  SetReg Sp (WAddr a')
  let nWords = nBytes `div` 2
  xs <- sequence [ addAddr (bytesPerWord * offset) a' | offset <- [ 0.. nWords -1 ] ]
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
  SLit l -> pure (fromLit l)
  STemp temp -> GetMem (ATempSpace temp)
  SMemIndirectOffset r i -> do
    a <- deAddr  <$> GetReg r
    a' <- addAddr i a
    GetMem a'

evalTarget :: Target -> M Addr
evalTarget = \case
  TTemp temp -> pure (ATempSpace temp)
  TReg r -> deAddr <$> GetReg r

execBare :: BareBios -> M ()
execBare = \case
  Bare_halt -> Halt
  Bare_crash -> Crash

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
    slideStackPointer AllocForUser numBytes
    execPushAlloc AllocForUser (WNum n) -- length word; part of user data
    w <- GetReg Sp
    SetReg Ax w
    let desc = RawData { evenSizeInBytes = fromIntegral numBytes + 2 } -- 2 for the length word
    execPushAlloc AllocForUser (WBlockDescriptor desc) -- size word; part of GC data

  Bare_set_bytes -> do -- TODO: no need for Bare
    a <- deAddr <$> GetReg Ax
    i <- deNum <$> GetReg Si
    c <- deChar <$> GetReg Bx
    a' <- addAddr (fromIntegral i + bytesPerWord) a  -- +bytesPerWord for the length word
    setMemByte a' c

  Bare_get_bytes -> do -- TODO: no need for Bare
    a <- deAddr <$> GetReg Ax
    i <- deNum <$> GetReg Bx
    a' <- addAddr (fromIntegral i + bytesPerWord) a  -- +bytesPerWord for the length word
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
  aligned <- (if even then pure a else addAddr (-1) a)
  w <- GetMem aligned
  let (c,d) = splitWord w
  let w' = WCharPair (if even then (x,d) else (c,x))
  SetMem aligned w'

getMemByte :: Addr -> M Char
getMemByte a = do
  let even = evenAddr a
  aligned <- (if even then pure a else addAddr (-1) a)
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
  CheckRecentAlloc :: Int -> M () -- This is ensure block-descriptors are correct
  BudgedForAllocation :: Int -> M ()
  Debug :: String -> M ()
  Print :: String -> M ()
  TraceOp :: Op -> M ()
  TraceJump :: Jump -> M ()
  TraceAlloc :: AllocMode -> M ()
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
  WhatHemi :: M Hemi -- in which we are allocating


data AllocMode = AllocForUser | AllocForGC

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
      trace (printf "{%03d}: %s.%d : %s\n"
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
      Crash -> ITrace "[Crash]\n" $ IDone

      CheckRecentAlloc expect -> do
        let State{allocsSinceLastCheck=actual} = s
        let same = (expect == actual)
        let m = printf "CheckRecentAlloc: expect=%d, actual=%d, same=%s\n" expect actual (show same)
        if not same then error m else
          k s { allocsSinceLastCheck = 0 } ()

      BudgedForAllocation n -> do
        k s { budgetAlloc = n, allocsSinceLastEnter = 0 } ()

      Debug m -> debug m $ k s ()
      Print m -> ITrace m $ k s ()

      TraceOp op -> traceOpOJump (show op) s k
      TraceJump jump -> traceOpOJump (show jump) s k

      TraceAlloc AllocForUser -> do
        let State{allocsSinceLastCheck,allocsSinceLastEnter,budgetAlloc} = s
        let die = ITrace (printf "alloc-budget-exceeded: %d\n" budgetAlloc) IDone
        if allocsSinceLastEnter == budgetAlloc then die else do
          ITick I.Alloc $ k s { allocsSinceLastCheck = 1 + allocsSinceLastCheck
                             , allocsSinceLastEnter = 1 + allocsSinceLastEnter
                             } ()

      TraceAlloc AllocForGC -> do -- no budget checking
        let State{allocsSinceLastCheck} = s
        ITick I.Copied $ k s { allocsSinceLastCheck = 1 + allocsSinceLastCheck
                             } ()

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
        let State{hemi,gcNum} = s -- gnNum trackked in M for Debug
        ITick I.GC $ -- also tracked as a tickable for reporting
          k s { gcNum = gcNum + 1, hemi = otherHemi hemi } gcNum

      WhatHemi -> do
        let State{hemi} = s
        k s hemi

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
  , allocsSinceLastEnter :: Int
  , budgetAlloc :: Int
  , gcNum :: Int
  , hemi :: Hemi
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
  , allocsSinceLastEnter = 0
  , budgetAlloc = 0
  , gcNum = 1
  , hemi = HemiA
  }
  where
    initialStackPointer = AHeapSpace (HeapAddr (fromIntegral topA))
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
      concat [ [(AStatic lab i,w) | (i,w) <- specsWords specs ]
             | (lab,specs) <- Map.toList dmap
             ]

vTag :: Ctag -> Word
vTag (Ctag _ n) = WNum n

specsWords :: [DataSpec] -> [(Int,Word)]
specsWords specs = [ (2*i,w) | (i,w) <- zip [0..] (specs >>= wordsOfSpec) ]
  where
    wordsOfSpec :: DataSpec -> [Word]
    wordsOfSpec = \case
      DW lits -> map fromLit lits
      DS string -> [ WCharPair (c,d) | (c,d) <- pairUp string ]
      where
        pairUp :: [Char] -> [(Char,Char)]
        pairUp = \case [] -> []; a:b:xs -> (a,b):pairUp xs; [a] -> [(a,'\0')]

fromLit :: Lit -> Word
fromLit = \case
  LChar x -> WChar x
  LNum x -> WNum x
  LStatic x -> WAddr (AStatic x 0)
  LCodeLabel x -> WCodeLabel x
  LBlockDescriptor x -> WBlockDescriptor x

instance Show State where
  show State{rmap} =
    intercalate " " [ show k ++ "=" ++ show w | (k,w) <- Map.toList rmap ]

aFalse,aTrue,aUnit,aFinalCont :: Addr

-- These three addresses are only used internally by stage5
aFalse = AStatic (DataLabelR "Bare_false") 0
aTrue = AStatic (DataLabelR "Bare_true") 0
aFinalCont = AStatic (DataLabelR "Bare_finalCont") 0

-- This address must be defined in runtime.asm
aUnit = AStatic dUnit 0

dUnit :: DataLabel
dUnit = DataLabelR "Bare_unit"

finalCodeLabel :: CodeLabel
finalCodeLabel = CodeLabel 0 "FINAL"

----------------------------------------------------------------------

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
  | WBrokenHeart
  deriving (Eq)

-- Of the 3 kinds of Addr. Only AHeapSpace and AStatic represent user values
-- The ATempSpace is more like a register, in that it is a location for values.
-- (Perhaps the types could be improved to make this clearer)

data Addr -- memory address
  = AHeapSpace HeapAddr
  | AStatic DataLabel Int -- This int is an offset at the data-label
  | ATempSpace SRC.Temp
  deriving (Eq,Ord)

data HeapAddr = HeapAddr Word16
  deriving (Eq,Ord)

instance Show HeapAddr where
  show (HeapAddr x) = "#" ++ show x

deHeapAddr :: Addr -> HeapAddr
deHeapAddr = \case
  AHeapSpace ha -> ha
  AStatic{} -> error "deHeapAddr/AStatic"
  ATempSpace{} -> error "deHeapAddr/ATempSpace"

evenAddr :: Addr -> Bool
evenAddr = \case
  AHeapSpace (HeapAddr n) -> (n `mod` 2) == 0
  AStatic _ offset -> (offset `mod` 2) == 0
  ATempSpace{} -> True

instance Show Word where
  show = \case
    WChar c -> show c
    WNum n -> show n
    WAddr a -> show a
    WCodeLabel lab -> show lab
    WBlockDescriptor d -> show d
    WUninitialized s -> printf "[uninialized:%s]" s
    WUninitializedCharPair -> "[uninialized-char-pair]"
    WCharPair p -> show p
    WBrokenHeart -> "[broken-heart]"

instance Show Addr where
  show = \case
    AHeapSpace ha -> show ha
    AStatic d offset -> printf "%s+%d" (show d) offset
    ATempSpace{} -> undefined

----------------------------------------------------------------------
-- GC

data Hemi = HemiA | HemiB deriving (Eq)

instance Show Hemi where show = \case HemiA -> "A"; HemiB -> "B"

otherHemi :: Hemi -> Hemi
otherHemi = \case HemiA -> HemiB; HemiB -> HemiA

topOfHemi :: Hemi -> Int
topOfHemi = \case HemiA -> topA; HemiB -> topB

botOfHemi :: Hemi -> Int
botOfHemi = \case HemiA -> botA; HemiB -> botB

inA,inB :: Int -> Bool
inA n = n <= topA && n >= botA
inB n = n <= topB && n >= botB

inHemi :: Int -> Hemi -> Bool
inHemi n = \case HemiA -> inA n; HemiB -> inB n

-- Invariant: The Sp will always be a HeapAddr
getSP :: M HeapAddr
getSP = (deHeapAddr . deAddr) <$> GetReg Sp

-- Check heap-address is in the hemi-space in which we are ALLOCATING.
mkHeapAddr :: Int -> M HeapAddr
mkHeapAddr n = do
  hemi <- WhatHemi
  if not (n `inHemi` hemi) then error (printf "mkHeapAddr: %d" n) else
    pure $ HeapAddr (fromIntegral n)

-- Check heap-address is in the hemi-space from which we are EVACUATING.
-- This version is used during GC when evacuating the old space.
mkHeapAddr_OTHER :: Int -> M HeapAddr
mkHeapAddr_OTHER n = do
  hemi <- WhatHemi
  if not (n `inHemi` otherHemi hemi) then error (printf "mkHeapAddr_OTHER: %d" n) else
    pure $ HeapAddr (fromIntegral n)

addHeapAddr :: Int -> HeapAddr -> M HeapAddr
addHeapAddr i (HeapAddr n) = mkHeapAddr (fromIntegral (n + fromIntegral i))

addHeapAddr_OTHER :: Int -> HeapAddr -> M HeapAddr
addHeapAddr_OTHER i (HeapAddr n) = mkHeapAddr_OTHER (fromIntegral (n + fromIntegral i))

addAddr :: Int -> Addr -> M Addr
addAddr i = \case
  AHeapSpace ha  -> AHeapSpace <$> addHeapAddr i ha
  AStatic lab n -> pure $ AStatic lab (n+i)
  ATempSpace{} -> undefined -- TODO: this can not happen. more refined rep will fix this

heapBytesRemaining :: M Int
heapBytesRemaining = do
  HeapAddr sp <- getSP
  hemi <- WhatHemi
  pure (fromIntegral sp - botOfHemi hemi)

setStackPointerToTopOfHemi :: Hemi -> M ()
setStackPointerToTopOfHemi hemi = do
  ha <- mkHeapAddr (topOfHemi hemi)
  SetReg Sp (WAddr (AHeapSpace ha))

gcTop :: M ()
gcTop = do
  fromSpace <- WhatHemi
  gcNum <- BumpGC
  toSpace <- WhatHemi
  if gcLiveWordsTrace then Print "[" else pure ()
  Debug (printf "GC(%d) starting: %s --> %s\n" gcNum (show fromSpace) (show toSpace))
  setStackPointerToTopOfHemi toSpace

  let roots = [frameReg,argReg,contReg]
  watermark0 <- getSP
  mapM_ evacuateReg roots
  loop 1 watermark0

  HeapAddr sp <- getSP
  let liveBytes = topOfHemi toSpace - fromIntegral sp
  Debug (printf "GC(%d) finished: liveBytes=%d\n" gcNum liveBytes)
  if gcLiveWordsTrace then  Print (printf "%d]" liveBytes) else pure ()

  where
    loop :: Int -> HeapAddr -> M ()
    loop step watermark = do
      sp <- getSP
      --Debug (printf "loop(%d.%d): SP=%s < WM=%s\n" gcNum step (show sp) (show watermark))
      let finished = assert (sp <= watermark) (sp == watermark)
      case finished of
        True -> pure ()
        False -> do
          nextWM <- getSP
          scanLoop 1 nextWM
          loop (step+1) nextWM

          where
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

evacuateReg :: Reg -> M ()
evacuateReg reg = do
  --Print (printf "evacuateReg: %s\n" (show reg))
  w <- GetReg reg
  evacuate w >>= \case
    Just w' -> SetReg reg w'
    Nothing -> pure ()

scavenge :: HeapAddr -> M HeapAddr
scavenge scanPointer = do
  descOpt <- getBlockDescriptor scanPointer
  let desc = case descOpt of Just d -> d; Nothing -> error "scavenge/BrokenHeart"
  let (sizeWords,mustScan) = case desc of Scanned n -> (n `div` 2, True); RawData n -> (n `div` 2, False)
  case mustScan of
    True -> do
      -- 1..size because we are pointing at descriptor
      xs <- sequence[ addHeapAddr (bytesPerWord * offset) scanPointer | offset <- [ 1 .. sizeWords ] ]
      mapM_ scavengeHA xs
      pure ()
    False -> pure ()

  addHeapAddr (bytesPerWord * (sizeWords+1)) scanPointer

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
  descA <- addHeapAddr_OTHER (-bytesPerWord) objectA
  --Debug (printf "evacuateHA: objectA=%s, descA=%s\n" (show objectA) (show descA))
  descOpt <- getBlockDescriptor descA
  let sizeBytesMaybe = (case descOpt of Just (Scanned n) -> Just n; Just (RawData n) -> Just n; Nothing -> Nothing)
  case sizeBytesMaybe of
    Just sizeBytes -> do
      let sizeWords = sizeBytes `div` 2
      xs <- sequence $ reverse [ addHeapAddr_OTHER (bytesPerWord * offset) objectA | offset <- [ -1 .. sizeWords-1 ] ]
      mapM_ copyAlloc xs
      sp <- getSP
      relocatedA <- addHeapAddr bytesPerWord sp -- point one word past the new desc
      -- overwrite original object with broken Heart; which points tothe relocated object
      SetMem (AHeapSpace descA) WBrokenHeart
      SetMem (AHeapSpace objectA) (WAddr (AHeapSpace relocatedA))
      pure relocatedA

    Nothing -> do -- BrokenHeart
      -- return the indirected previously copied object
      (deHeapAddr . deAddr)  <$> GetMem (AHeapSpace objectA)

copyAlloc :: HeapAddr -> M ()
copyAlloc ha = do
  w <- GetMem (AHeapSpace ha)
  execPushAlloc AllocForGC w
  --_newAddress <- getSP
  --Debug (printf "copyAlloc: %s --> (%s) --> %s\n" (show ha) (show w) (show _newAddress))
  pure ()

getBlockDescriptor :: HeapAddr -> M (Maybe BlockDescriptor) -- TODO: inline is cleaner
getBlockDescriptor ha = do
  w <- GetMem (AHeapSpace ha)
  case w of
    WBlockDescriptor d -> pure (Just d)
    WBrokenHeart -> pure Nothing
    w -> error (printf "getBlockDescriptor: not a block-descriptor: %s at %s" (show w) (show ha))
