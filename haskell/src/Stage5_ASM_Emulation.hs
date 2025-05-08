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
-- Runtime values.

-- WChar, VNum, VAddr -- Representation of user Values. Things that user code can compute with.
-- WCodeLabel -- Found only in slot 0 of a continuation/closure frame.
-- WBlockDescriptor -- Found only in slot -1 of all heap block.

-- Heap address are word aligned, and so always have an even value.
-- Numbers are tagged (2n+1) and so are always odd.

data Word
  = WChar Char
  | WNum Number -- number with 2n+1
  | WAddr Addr
  | WCodeLabel CodeLabel
  | WCharPair (Char,Char)
  | WBlockDescriptor BlockDescriptor
  | WBrokenHeart
  | WUninitialized String
  | WUninitializedCharPair
  deriving (Eq)

data Addr
  = AHeap HeapAddr
  | AStatic DataLabel Int -- This int is an offset at the data-label
  deriving (Eq,Ord)

data HeapAddr = HeapAddr Word16
  deriving (Eq,Ord)

instance Show Word where
  show = \case
    WChar c -> show c
    WNum n -> show n
    WAddr a -> show a
    WCodeLabel lab -> show lab
    WCharPair p -> show p
    WBlockDescriptor d -> show d
    WBrokenHeart -> "[broken-heart]"
    WUninitialized s -> printf "[uninialized:%s]" s
    WUninitializedCharPair -> "[uninialized-char-pair]"

instance Show Addr where
  show = \case
    AHeap ha -> show ha
    AStatic d offset -> printf "%s+%d" (show d) offset

instance Show HeapAddr where
  show (HeapAddr x) = "#" ++ show x

deHeapAddr :: Word -> HeapAddr
deHeapAddr = \case
  WAddr (AHeap ha) -> ha
  _ -> error "deHeapAddr"

evenAddr :: Addr -> Bool
evenAddr = \case
  AHeap (HeapAddr n) -> (n `mod` 2) == 0
  AStatic _ offset -> (offset `mod` 2) == 0

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
getSP = deHeapAddr <$> GetReg Sp

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
  AHeap ha  -> AHeap <$> addHeapAddr i ha
  AStatic lab n -> pure $ AStatic lab (n+i)

heapBytesRemaining :: M Int
heapBytesRemaining = do
  HeapAddr sp <- getSP
  hemi <- WhatHemi
  pure (fromIntegral sp - botOfHemi hemi)

setStackPointerToTopOfHemi :: Hemi -> M ()
setStackPointerToTopOfHemi hemi = do
  ha <- mkHeapAddr (topOfHemi hemi)
  SetReg Sp (WAddr (AHeap ha))

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
  GetMem (AHeap scanPointer) >>= \case
    WBlockDescriptor desc -> do
      let BlockDescriptor{sizeInBytes,scanMode} = desc
      let sizeWords = sizeInBytes `div` 2
      nextScanPointer <- addHeapAddr (bytesPerWord * (sizeWords+1)) scanPointer
      case scanMode of
        RawData -> pure nextScanPointer
        Scanned -> do
          -- 1..size because we are pointing at descriptor
          xs <- sequence[ addHeapAddr (bytesPerWord * offset) scanPointer | offset <- [ 1 .. sizeWords ] ]
          mapM_ scavengeHA xs
          pure nextScanPointer
    w ->
      error (printf "scavenge: not a block-descriptor: %s at %s" (show w) (show scanPointer))

scavengeHA :: HeapAddr -> M ()
scavengeHA ha = do
  w <- GetMem (AHeap ha)
  evacuate w >>= \case
    Just w' -> SetMem (AHeap ha) w'
      --Debug (printf "scavengeHA: %s : %s --> %s\n" (show ha) (show w) (show w'))
    Nothing -> do
      --Debug (printf "scavengeHA: %s : unmoved\n" (show ha))
      pure ()

evacuate :: Word -> M (Maybe Word)
evacuate w = do
  --Debug (printf "evacuate: %s\n" (show w))
  case w of
    WAddr (AHeap ha) -> (Just . WAddr . AHeap) <$> evacuateHA ha
    _ -> pure Nothing

evacuateHA :: HeapAddr -> M HeapAddr
evacuateHA objectA = do
  descA <- addHeapAddr_OTHER (-bytesPerWord) objectA
  --Debug (printf "evacuateHA: objectA=%s, descA=%s\n" (show objectA) (show descA))
  GetMem (AHeap descA) >>= \case
    WBlockDescriptor desc -> do
      let BlockDescriptor{sizeInBytes} = desc
      let sizeWords = sizeInBytes `div` 2
      xs <- sequence $ reverse [ addHeapAddr_OTHER (bytesPerWord * offset) objectA | offset <- [ -1 .. sizeWords-1 ] ]
      mapM_ copyAlloc xs
      sp <- getSP
      relocatedA <- addHeapAddr bytesPerWord sp -- point one word past the new desc
      -- overwrite original object with broken Heart; which points tothe relocated object
      SetMem (AHeap descA) WBrokenHeart
      SetMem (AHeap objectA) (WAddr (AHeap relocatedA))
      pure relocatedA
    WBrokenHeart ->
      -- return the indirected previously copied object
      deHeapAddr <$> GetMem (AHeap objectA)
    w ->
      error (printf "evacuateHA: not a block-descriptor: %s at %s" (show w) (show objectA))

copyAlloc :: HeapAddr -> M ()
copyAlloc ha = do
  w <- GetMem (AHeap ha)
  execPushAlloc AllocForGC w
  --_newAddress <- getSP
  --Debug (printf "copyAlloc: %s --> (%s) --> %s\n" (show ha) (show w) (show _newAddress))
  pure ()

----------------------------------------------------------------------
-- Execute

type Transformed = Image

data TraceFlag = TraceOn | TraceOff
data DebugFlag = DebugOn | DebugOff

execute :: Transformed -> TraceFlag -> DebugFlag -> Bool -> Interaction
execute i trace debug measureFlag = runM trace debug measureFlag i (execImage i)

execImage :: Image -> M ()
execImage Image{start} = GetCode start >>= execCode

execCode :: Code -> M ()
execCode = \case
  Do (OpComment{}) code -> execCode code
  Do (OpMany []) code -> execCode code
  Do (OpMany (op:ops)) code -> execCode $ Do op (Do (OpMany ops) code)
  Do op code -> do
    TraceOp op
    execOp op (execCode code)
  Done jump -> do
    TraceJump jump
    execJump jump

execOp :: Op -> M () -> M ()
execOp = \case
  OpComment{} -> error "execOp/OpComment"
  OpMany{} -> error "execOp/OpMany"
  OpMove r s -> \cont -> do w <- evalSource s; SetReg r w; cont
  OpStore t s -> \cont -> do w <- GetReg s; setTarget t w; cont
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
  OpShiftR1 r -> \cont -> do
    x <- deNum <$> GetReg r
    SetReg r (WNum (x `div` 2)) -- unatg
    cont
  OpShiftL1 r -> \cont -> do
    x <- deNum <$> GetReg r
    SetReg r (WNum (2 * x)) -- tag step 1
    cont
  OpInc r -> \cont -> do
    x <- deNum <$> GetReg r
    SetReg r (WNum (x + 1)) -- tag step 2
    cont
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
  OpHlt -> \cont -> -- TODO: better emulation for this?
    cont

-- this is called from user code which does OpPush & also from GC when copying
-- performs sanity checking when a block-descriptor is pushed
execPushAlloc :: AllocMode -> Word -> M ()
execPushAlloc mode w = do
  a <- deAddr <$> GetReg Sp
  a' <- addAddr (-(bytesPerWord)) a
  SetMem a' w
  SetReg Sp (WAddr a')
  Debug (printf "Alloc: %s = %s\n" (show a') (show w))
  sequence_ (replicate bytesPerWord (TraceAlloc mode))
  checkPushBlockDescriptor w

checkPushBlockDescriptor :: Word -> M ()
checkPushBlockDescriptor = \case
  WBlockDescriptor (BlockDescriptor {sizeInBytes}) -> do
    CheckRecentAlloc (sizeInBytes + 2) -- 2 for the block descriptor itself
  _ ->
    pure ()

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
  STemp temp -> GetTemp temp
  SMemIndirectOffset r i -> do
    a <- deAddr  <$> GetReg r
    a' <- addAddr i a
    GetMem a'

setTarget :: Target -> Word -> M ()
setTarget = \case
  TTemp temp -> \w ->
    SetTemp temp w
  TReg r -> \w -> do
    a <- deAddr <$> GetReg r
    SetMem a w

execBare :: BareBios -> M ()
execBare = \case
  Bare_halt -> Halt
  Bare_crash -> Crash

  Bare_get_char -> do c <- GetChar; SetReg Ax (WChar c)
  Bare_put_char -> do c <- deChar <$> GetReg Ax; PutChar c

  Bare_make_bool_from_z -> do
    b <- GetFlagZ
    SetReg Ax (WAddr (if b then aTrue else aFalse))
  Bare_make_bool_from_nz -> do
    b <- GetFlagZ
    SetReg Ax (WAddr (if b then aFalse else aTrue))
  Bare_make_bool_from_n -> do
    b <- GetFlagN
    SetReg Ax (WAddr (if b then aTrue else aFalse))

  Bare_num_to_char -> do
    n <- deNum <$> GetReg Ax
    SetReg Ax (WChar (Char.chr (fromIntegral n)))
  Bare_char_to_num -> do
    c <- deChar <$> GetReg Ax
    SetReg Ax (WNum (fromIntegral $ Char.ord c))

  Bare_make_bytes -> do
    n <- deNum <$> GetReg Ax
    let nBytes = n `div` 2
    let nBytesAligned = fromIntegral (2 * ((nBytes+1) `div` 2))
    slideStackPointer AllocForUser nBytesAligned
    execPushAlloc AllocForUser (WNum n) -- tagged length word; part of user data
    w <- GetReg Sp
    SetReg Ax w
    let desc = BlockDescriptor RawData (fromIntegral nBytesAligned + 2) -- 2 for the length word
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

  Bare_free_words -> do
    DoMeasure >>= \case
      False -> SetReg Ax (WNum 0)
      True -> do
        gcTop -- force a GC before we calculate the #free-words
        hemi <- WhatHemi
        HeapAddr sp <- getSP
        let freeWords = fromIntegral ((fromIntegral sp - botOfHemi hemi) `div` 2)
        SetReg Ax (WNum freeWords)

  Bare_get_ticks -> do  -- TODO: really pause
    SetReg Ax (WNum 0)

  Bare_wait_a_tick -> do  -- TODO: really pause
    pure ()
  Bare_is_keyboard_ready -> do -- TODO: really check; dont lie
    SetFlagZ False -- always ready

  Bare_get_keyboard_last_scancode -> do -- TODO: convert back to scancode for better emulation
    c <- GetScanCode
    SetReg Ax (WChar c)

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

deNum :: Word -> Number -- giving the 2n+1 rep -- this is the one we want everywhere
deNum = \case
  WNum x -> x --
  w -> error (show("deNum",w))

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
  DoMeasure :: M Bool
  TraceOp :: Op -> M ()
  TraceJump :: Jump -> M ()
  TraceAlloc :: AllocMode -> M ()
  GetCode :: CodeLabel -> M Code
  SetReg :: Reg -> Word -> M ()
  GetReg :: Reg -> M Word
  SetTemp :: SRC.Temp -> Word -> M ()
  GetTemp :: SRC.Temp -> M Word
  SetMem :: Addr -> Word -> M ()
  GetMem :: Addr -> M Word
  SetFlagZ :: Bool -> M ()
  GetFlagZ :: M Bool
  SetFlagN :: Bool -> M ()
  GetFlagN :: M Bool
  PutChar :: Char -> M ()
  GetChar :: M Char
  GetScanCode :: M Char
  BumpGC :: M Int
  WhatHemi :: M Hemi -- in which we are allocating

data AllocMode = AllocForUser | AllocForGC

runM :: TraceFlag -> DebugFlag -> Bool -> Image -> M () -> Interaction
runM traceFlag debugFlag measureFlag Image{cmap=cmapUser,dmap} m = loop stateLoaded m k0

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
    loop s@State{rmap,tmap,mem,flagZ,flagN} m k = case m of

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

      DoMeasure -> k s measureFlag

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
        k s { rmap = Map.insert r w rmap } ()

      GetReg r -> k s (maybe err id $ Map.lookup r rmap)
        where err = WUninitialized $ show ("GetReg/uninitialized",r)

      SetTemp t w -> do
        k s { tmap = Map.insert t w tmap } ()

      GetTemp t -> k s (maybe err id $ Map.lookup t tmap)
        where err = WUninitialized $ show ("GetTemp/uninitialized",t)

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
      GetScanCode -> IGetScanCode $ \c -> k s c

      BumpGC -> do
        let State{hemi,gcNum} = s -- gnNum trackked in M for Debug
        ITick I.GC $ -- also tracked as a tickable for reporting
          k s { gcNum = gcNum + 1, hemi = otherHemi hemi } gcNum

      WhatHemi -> do
        let State{hemi} = s
        k s hemi

data State = State
  { rmap :: Map Reg Word
  , tmap :: Map SRC.Temp Word
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
  , tmap = Map.empty
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
    initialStackPointer = AHeap (HeapAddr (fromIntegral topA))
    rmap = Map.fromList
      [ (Sp, WAddr initialStackPointer)
      , (Cx, WAddr aFinalCont)
      ]
    mem = Map.fromList (internal ++ user)

    internal =
      [ (aFalse, tagging tFalse)
      , (aTrue, tagging tTrue)
      , (aUnit, tagging tUnit)
      , (aFinalCont, WCodeLabel finalCodeLabel)
      ]
    user =
      concat [ [(AStatic lab i,w) | (i,w) <- specsWords specs ]
             | (lab,specs) <- Map.toList dmap
             ]

tagging :: Ctag -> Word
tagging (Ctag _ n) = WNum (2 * n + 1)

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
