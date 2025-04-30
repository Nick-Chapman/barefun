-- | Generate x86 assembly
module Stage5_ASM
  ( execute, TraceFlag(..), DebugFlag(..)
  , compile
  ) where

import Builtin (Builtin)
import Control.Monad (ap,liftM)
import Data.Char (ord)
import Data.List (intercalate)
import Data.Map (Map)
import Data.Set (Set)
import Data.Word (Word16)
import Prelude hiding (Word)
import Stage1_EXP (Ctag(..))
import Text.Printf (printf)
import Value (Interaction(..))
import Value (Number,tTrue,tFalse,tNil)
import qualified Builtin as SRC (Builtin(..))
import qualified Data.Char as Char (chr,ord)
import qualified Data.Map as Map
import qualified Data.Set as Set
import qualified Stage4_CCF as SRC
import qualified Value as I (Tickable(Op,Alloc))

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
  | DB [Char]
  | DS String

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
  | Crash

data Source
  = SReg Reg
  | SLit Word
  | SMem Addr
  | SMemIndirect Reg
  | SMemIndirectOffset Reg Int -- byte indexing

-- Word is a structured type for the contents of a register or memory location
-- We use a variant type to help catch compiler bugs during dev.
-- On a real system, the representations will overlap.
-- Tagging will distinguish pointer from non-pointer.

data Word
  = WChar Char
  | WNum Number
  | WAddr Addr
  | WCodeLabel CodeLabel
  | WUninitialized String
  | WBlockDescriptor BlockDescriptor
  deriving Eq

data BlockDescriptor
  = Scanned { evenSizeInBytes :: Int }
  | RawData { evenSizeInBytes :: Int }
  deriving Eq

vTag :: Ctag -> Word
vTag (Ctag _ n) = WNum n

data Reg = Ax | Bx | Cx | Dx | Sp | Bp | Si | Di
  deriving (Eq,Ord)

data Addr -- memory address
  = AHeapSpace HeapAddr
  | AStatic DataLabel Int -- This int is an offset at the data-label
  | ATempSpace SRC.Temp
  deriving (Eq,Ord)

data HeapAddr = HeapAddr Word16
  deriving (Eq,Ord)

data CodeLabel = CodeLabel Int String -- unique label and provenance
  deriving (Eq,Ord)

data DataLabel = DataLabel SRC.Global
  deriving (Eq,Ord)

-- BareBios; primitive routines available to the compiled code
data BareBios
  -- Base_clear_screen -- TODO: expose to user code
  = Bare_halt -- TODO: not in runtime.asm -- so should not be a Bare call?
  | Bare_crash
  | Bare_enter_check
  | Bare_put_char
  | Bare_get_char
  | Bare_make_bool_from_z
  | Bare_make_bool_from_n
  | Bare_num_to_char
  | Bare_char_to_num
  | Bare_addr_to_num

  | Bare_string_length
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
    OpMove r src -> "mov " ++ show r ++ ", " ++ show src
    OpStore a src -> "mov [" ++ show a ++ "], " ++ show src
    OpStoreR t src -> "mov word [" ++ show t ++ "], " ++ show src
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
    Crash -> "crash"

instance Show Source where
  show = \case
    SReg r -> show r
    SLit w -> show w
    SMem a -> "["++show a++"]"
    SMemIndirect r -> "["++show r++"]"
    SMemIndirectOffset r n -> "["++show r++"+"++show n++"]"

instance Show Word where
  show = \case
    WChar c -> printf "`%s`" (escapeCharForNasm c)
    WNum n -> show n
    WAddr a -> show a
    WCodeLabel lab -> show lab
    WUninitialized m -> printf "[uninitialized:%s]" m
    WBlockDescriptor d -> show d

instance Show BlockDescriptor where
  show = \case
    Scanned n -> show n ++ " ;; scanned"
    RawData n -> show n ++ " ;; raw-data"

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
    execPushAlloc w
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

execPushAlloc :: Word -> M ()
execPushAlloc w = do
  a <- deAddr <$> GetReg Sp
  sequence_ (replicate bytesPerWord TraceAlloc)
  let a' = addAddr (-(bytesPerWord)) a
  SetMem a' w
  SetReg Sp (WAddr a')
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
  WBlockDescriptor desc ->
    CheckRecentAlloc (sizeOfBD desc + 2) -- 2 for the block descriptor itself
    where sizeOfBD = \case Scanned n -> n; RawData n -> n
  _ ->
    pure ()

slideStackPointer :: Int -> M ()
slideStackPointer nBytes = do
  sequence_ (replicate (nBytes) TraceAlloc)
  a <- deAddr <$> GetReg Sp
  let a' = addAddr (-(nBytes)) a
  SetReg Sp (WAddr a')

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

  Bare_enter_check -> do
    x <- deAddr <$> GetReg Sp
    Debug (printf "Bare_enter_check[%s]\n" (show x))
    MaybeGC
    pure ()

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

  Bare_addr_to_num -> do
    a <- deAddr <$> GetReg Ax
    SetReg Ax (WNum (fromIntegral $ deheapAddr a))

  Bare_make_bytes -> do
    n <- deNum <$> GetReg Ax
    let numBytes = align (fromIntegral n) where align n = 2 * ((n+1) `div` 2)
    slideStackPointer numBytes
    execPushAlloc (WNum n) -- length word; part of user data
    w <- GetReg Sp
    SetReg Ax w
    let desc = RawData { evenSizeInBytes = fromIntegral numBytes + 2 } -- 2 for the length word
    execPushAlloc (WBlockDescriptor desc) -- size word; part of GC data

  -- TODO: no need for Bare given better string rep; just generate ops
  -- 3x cases: Bare_string_length, Bare_set_bytes, Bare_get_bytes

  Bare_set_bytes -> do
    a <- deAddr <$> GetReg Ax
    i <- deNum <$> GetReg Si
    c <- deChar <$> GetReg Bx
    let a' = addAddr (fromIntegral i + bytesPerWord) a  -- +bytesPerWord for the length word
    SetMem a' (WChar c)

  Bare_get_bytes -> do
    a <- deAddr <$> GetReg Ax
    i <- deNum <$> GetReg Bx
    let a' = addAddr (fromIntegral i + bytesPerWord) a  -- +bytesPerWord for the length word
    c <- GetMem a'
    SetReg Ax c

  Bare_string_length -> do
    a <- deAddr <$> GetReg Ax
    n <- deNum <$> GetMem a
    SetReg Ax (WNum n)

  Bare_load_sector -> do -- TODO: emulate in Value/Interaction
    pure ()
  Bare_store_sector -> do -- TODO: emulate in Value/Interaction
    pure ()


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
deChar = \case
  WChar x -> x
  WUninitialized{} -> '\0' -- for bytes example
  w -> error (show("deChar",w))

deNum :: Word -> Number
deNum = \case WNum x -> x; w -> error (show("deNum",w))

addAddr :: Int -> Addr -> Addr
addAddr i = \case
  AHeapSpace ha  -> AHeapSpace (addHeapAddr i ha)
  AStatic lab n -> AStatic lab (n+i)
  ATempSpace{} -> undefined

addHeapAddr :: Int -> HeapAddr -> HeapAddr
addHeapAddr i (HeapAddr n) = mkHeapAddr (fromIntegral (n + fromIntegral i))

mkHeapAddr :: Int -> HeapAddr
mkHeapAddr n =
  if n < (twoE16 `div` 2) then error "mkHeapAddr:too small" else
    if n > twoE16 then error "mkHeapAddr:too big" else
      HeapAddr (fromIntegral n)

deheapAddr :: Addr -> Int
deheapAddr = \case
  AHeapSpace (HeapAddr n) -> fromIntegral n `div` 2
  AStatic{} -> undefined "deheapAddr/AStatic"
  ATempSpace{} -> undefined "deheapAddr/ATempSpace"

----------------------------------------------------------------------
-- Execution monad (emulation!)

instance Functor M where fmap = liftM
instance Applicative M where pure = Ret; (<*>) = ap
instance Monad M where (>>=) = Bind

data M a where
  Ret :: a -> M a
  Bind :: M a -> (a -> M b) -> M b
  Halt :: M ()
  CheckRecentAlloc :: Int -> M ()
  Debug :: String -> M ()
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
  MaybeGC :: M ()

runM :: TraceFlag -> DebugFlag -> Image -> M () -> Interaction
runM traceFlag debugFlag Image{cmap=cmapUser,dmap} m = loop stateLoaded m k0

  where

    stateLoaded = state0 dmap

    k0 _s () = IDone

    cmap = Map.insert finalCodeLabel finalCode cmapUser
    finalCode = Do (OpCall Bare_halt) (Done Crash)

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
    loop s@State{rmap,mem,flagZ,flagN} m k = case m of

      Ret x -> k s x
      Bind m f -> loop s m $ \s a -> loop s (f a) k
      Halt -> IDone

      CheckRecentAlloc expect -> do
        let State{allocsSinceLastCheck=actual} = s
        let same = (expect == actual)
        let m = printf "CheckRecentAlloc: expect=%d, actual=%d, same=%s\n" expect actual (show same)
        debug m $
          if not same then error m else
            k s { allocsSinceLastCheck = 0 } ()

      Debug m -> debug m $ k s ()

      TraceOp op -> traceOpOJump (show op) s k
      TraceJump jump -> traceOpOJump (show jump) s k

      TraceAlloc{} -> do
        let State{allocsSinceLastCheck} = s
        ITick I.Alloc $ k s { allocsSinceLastCheck = 1 + allocsSinceLastCheck } ()

      GetCode lab -> do
        k s { lastCodeLabel = lab, offsetFromLastLabel = 0 } (maybe err id $ Map.lookup lab cmap)
        where err = error (show ("runM/GetCode",lab))

      SetReg r w -> do
        checkAlignedSp r w $
          k s { rmap = Map.insert r w rmap } ()

      GetReg r -> k s (maybe err id $ Map.lookup r rmap)
        where err = error (show ("GetReg/uninitialized",r))

      SetMem a w -> do
        k s { mem = Map.insert a w mem } ()
      GetMem a ->
        k s (maybe err id $ Map.lookup a mem)
        where err = WUninitialized $ show ("GetMem/uninitialized",a)

      SetFlagZ b -> k s { flagZ = b } ()
      GetFlagZ -> k s flagZ

      SetFlagN b -> k s { flagN = b } ()
      GetFlagN -> k s flagN

      PutChar c -> IPut c (k s ())
      GetChar -> IGet $ \c -> k s c

      MaybeGC -> do
        IIO $ do
          let roots = [ maybe undefined id $ Map.lookup r rmap | r <- [frameReg,argReg,contReg] ]
          reachable <- discoverReachable roots mem
          let
            isReachable :: Addr -> v -> Bool
            isReachable a _ =
              case a of
                AStatic{} -> True
                ATempSpace{} -> True
                AHeapSpace ha -> Set.member ha reachable

          mem <- pure $ Map.filterWithKey isReachable mem
          pure $ do
            debug (printf "#reachable:%d\n" (Set.size reachable)) $ do
              debug (printf "#mem-space:%d\n" (Map.size mem)) $ do
                k s { mem } ()

checkAlignedSp :: Reg -> Word -> Interaction -> Interaction
checkAlignedSp = \case
  Sp -> \case
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
  }
  where
    initialStackPointer = AHeapSpace (mkHeapAddr twoE16)
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
      ]
    user =
      concat [ [(AStatic lab i,w) | (i,w) <- specsWords 0 specs ]
             | (lab,specs) <- Map.toList dmap
             ]

specsWords :: Int -> [DataSpec] -> [(Int,Word)]
specsWords offset = \case
  [] -> []
  DW ws : specs ->
    [ (offset + (2*i), w) | (i,w) <- zip [0..] ws ] ++ specsWords (offset + 2 * length ws) specs
  DB cs : specs ->
    [ (offset + i, WChar c) | (i,c) <- zip [0..] cs ] ++ specsWords (offset + length cs) specs
  DS s : specs ->
    [ (offset + i, WChar c) | (i,c) <- zip [0..] s ] ++ specsWords (offset + length s) specs

instance Show State where
  show State{rmap} =
    intercalate " " [ show k ++ "=" ++ show w | (k,w) <- Map.toList rmap ]

aFalse,aTrue,aNil,aFinalCont :: Addr
aFalse = AStatic (DataLabel (SRC.Global (-1))) 0
aTrue = AStatic (DataLabel (SRC.Global (-2))) 0
aNil = AStatic (DataLabel (SRC.Global (-3))) 0
aFinalCont = AStatic (DataLabel (SRC.Global (-4))) 0

finalCodeLabel :: CodeLabel
finalCodeLabel = CodeLabel 0 "FINAL"

----------------------------------------------------------------------
-- GC

discoverReachable :: [Word] -> Map Addr Word -> IO (Set HeapAddr)
discoverReachable roots mem = do
  loop [] Set.empty roots
  where

    lookMem :: Addr -> Word
    lookMem a = maybe err id $ Map.lookup a mem
      where err = error (show ("discoverReachable/lookMem",a))

    loop :: [HeapAddr] -> Set HeapAddr -> [Word] -> IO (Set HeapAddr)
    loop live visited = \case
      [] -> pure (Set.fromList live)
      scan1:toScan -> do
        case heapAddressMaybe scan1 of
          Nothing -> loop live visited toScan
          Just ha -> do
            if ha `Set.member` visited then loop live visited toScan else do
              visited <- pure (Set.insert ha visited)
              let descA = addHeapAddr (-bytesPerWord) ha
              let d = lookupDescriptor descA
              let size = case d of Scanned n -> n; RawData n -> n
              let moreLive = [ addHeapAddr off ha | off <- [0 .. size-1] ]
              let moreToScan = case d of
                    RawData{} -> []
                    Scanned{} ->
                      [ lookMem (AHeapSpace (addHeapAddr offset ha))
                      | offset <- [0..size-1]
                      , offset `mod` bytesPerWord == 0
                      ]
              loop (descA : moreLive ++ live) visited (moreToScan ++ toScan)

    lookupDescriptor :: HeapAddr -> BlockDescriptor
    lookupDescriptor descA =
      case Map.lookup (AHeapSpace descA) mem of
        Nothing -> error "lookupDescriptor: missing"
        Just w -> do
          case (case w of WBlockDescriptor d -> Just d; _ -> Nothing) of
            Nothing -> error "lookupDescriptor: not a block-descriptor"
            Just d -> d



heapAddressMaybe :: Word -> Maybe HeapAddr
heapAddressMaybe = \case
  WChar{} -> Nothing
  WNum{} -> Nothing
  WCodeLabel{} -> Nothing
  WUninitialized{} -> Nothing
  WBlockDescriptor{} -> error "An addressed word should never be a block descriptor"
  WAddr (AHeapSpace ha) -> Just ha
  WAddr{} -> Nothing


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

compileTopDef :: DataLabel -> SRC.Top -> Asm [DataSpec]
compileTopDef lab = \case
  SRC.TopPrim b xs -> undefined b xs -- TODO: provoke or remove

  SRC.TopLitS string ->
    pure (DW [ WNum (fromIntegral $ length string) ]
--           : [ DB [ c | c <- string ] ]
           : [ DS string ]
         )

  SRC.TopLam _x body -> do
    lab <- compileCode body >>= CutCode ("Function: " ++ show lab)
    let w1 = WCodeLabel lab
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
      -- position info in comments in generated ASM is very unstable to tiny changes.
      [ --OpComment $ printf "(%s) Return: %s" (show _pos) (ppRef res)
        OpMove argReg (compileRef res)
      , OpMove frameReg (SReg contReg)
      , OpMove contReg (SMemIndirectOffset frameReg bytesPerWord)
      ] (Done (JumpIndirect frameReg))

  SRC.Tail fun _pos arg -> do
    pure $ doOps (
      -- [ OpComment $ printf "(%s) Tail: %s @ %s" (show _pos) (ppRef fun) (ppRef arg) ] ++
      -- (arg,frame) = ...
       moveTwoRegsPar (frameReg,compileRef fun) (argReg,compileRef arg) ++
      []) (Done (JumpIndirect frameReg))

  SRC.LetAtomic (_,t) rhs body -> do
    ops <- compileAtomicTo t rhs
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
  pure [ OpCmp (SMemIndirect scrutReg) (SLit (WNum n))
       , OpBranchFlagZ lab
       ]

compileArmTaken :: Reg -> SRC.Arm -> Asm Code
compileArmTaken scrutReg arm =  do
  let (SRC.ArmTag _pos _tag xs rhs) = arm
  let ops = concat [ [ OpMove Ax (SMemIndirectOffset scrutReg (bytesPerWord * i))
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


compileAtomicTo :: SRC.Temp -> SRC.Atomic -> Asm [Op]
compileAtomicTo temp = \case
  SRC.Prim b xs -> pure (compileBuiltinTo temp b (map compileRef xs))
  SRC.ConApp (Ctag _ tag) xs -> pure (compileConAppTo temp tag xs)
  SRC.Lam pre _post _x body -> compileFunctionTo temp pre body
  SRC.RecLam pre _post _f _x body -> compileFunctionTo temp pre body

compileConAppTo :: SRC.Temp -> Number -> [SRC.Ref] -> [Op]
compileConAppTo temp tag xs = do
  let desc = Scanned { evenSizeInBytes = 2 * (length xs + 1) }
  map OpPush (reverse (SLit (WNum tag) : map compileRef xs)) ++
    [ setTemp temp (SReg Sp)
    , OpPush (SLit (WBlockDescriptor desc)) -- pushed *after* Sp is read
    ]

compileFunctionTo :: SRC.Temp -> [SRC.Ref] -> SRC.Code -> Asm [Op]
compileFunctionTo temp freeVars body = do
  lab <- compileCode body >>= CutCode ("Function: " ++ show temp)
  let desc = Scanned { evenSizeInBytes = 2 * (length freeVars + 1) }
  pure (
    map OpPush (reverse (map compileRef freeVars)) ++
    [ OpPush (SLit (WCodeLabel lab))
    , setTemp temp (SReg Sp)
    , OpPush (SLit (WBlockDescriptor desc)) -- pushed *after* Sp is read
    ])

compileBuiltinTo :: SRC.Temp -> Builtin -> [Source] -> [Op]
compileBuiltinTo temp b args =
  compileBuiltinToAx b args ++
  [setTemp temp (SReg Ax)]

-- TODO: target reg/temp should be passed down
compileBuiltinToAx :: Builtin -> [Source] -> [Op] -- --> Ax
compileBuiltinToAx b = case b of
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
    [ OpMove Ax s1 ] ++
    case s2 of
      SReg s2Reg -> [ OpMulIntoAx s2Reg ]
      _ -> [ OpMove Bx s2 , OpMulIntoAx Bx ]

  SRC.DivInt -> twoArgs $ \s1 s2 ->
    [ OpMove Ax s1
    , OpMove Bx s2
    , OpPushSAVE (SReg Dx)
    , OpMove Dx (SLit (WNum 0))
    , OpDivModIntoAxDx Bx
    -- quotiant already in Ax
    , OpPopRESTORE Dx
    ]
  SRC.ModInt -> twoArgs $ \s1 s2 ->
    [ OpMove Ax s1
    , OpMove Bx s2
    , OpPushSAVE (SReg Dx)
    , OpMove Dx (SLit (WNum 0))
    , OpDivModIntoAxDx Bx
    -- remainder in Dx
    , OpMove Ax (SReg Dx)
    , OpPopRESTORE Dx
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
  SRC.CharChr -> oneArg $ \s1 ->
    [ OpMove Ax s1
    , OpCall Bare_num_to_char
    ]
  SRC.CharOrd -> oneArg $ \s1 ->
    [ OpMove Ax s1
    , OpCall Bare_char_to_num
    ]

  SRC.MakeRef -> oneArg $ \s1 ->
    let desc = Scanned { evenSizeInBytes = 2 } in
    [ OpPush s1
    , OpMove Ax (SReg Sp)
    , OpPush (SLit (WBlockDescriptor desc)) -- pushed *after* Sp is read
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

  SRC.MakeBytes -> oneArg $ \s1 ->
    [ OpMove Ax s1
    , OpCall Bare_make_bytes
    ]
  SRC.SetBytes -> threeArgs $ \s1 s2 s3 ->
    [ OpMove Ax s1
    , OpMove Si s2
    , OpMove Bx s3
    , OpCall Bare_set_bytes
    ]
  SRC.GetBytes -> twoArgs $ \s1 s2 ->
    [ OpMove Ax s1
    , OpMove Bx s2
    , OpCall Bare_get_bytes
    ]

  -- Freeze/Thaw: null-imp, bytes/string have the same representation
  SRC.FreezeBytes -> oneArg $ \s1 -> [ OpMove Ax s1 ]
  SRC.ThawBytes -> oneArg $ \s1 -> [ OpMove Ax s1 ]

  SRC.StringLength -> oneArg $ \s1 ->
    [ OpMove Ax s1
    , OpCall Bare_string_length
    ]
  -- same implementations as SRC.GetBytes
  SRC.StringIndex -> twoArgs $ \s1 s2 ->
    [ OpMove Ax s1
    , OpMove Bx s2
    , OpCall Bare_get_bytes
    ]

  SRC.Crash -> oneArg $ \_ -> [ OpCall Bare_crash ]

  SRC.LoadSec -> twoArgs $ \s1 s2 ->
    [ OpMove Ax s1
    , OpMove Bx s2
    , OpCall Bare_load_sector
    ]

  SRC.StoreSec -> twoArgs $ \s1 s2 ->
    [ OpMove Ax s1
    , OpMove Bx s2
    , OpCall Bare_store_sector
    ]

  SRC.GetStackPointer -> oneArg $ \_ ->
    [ OpMove Ax (SReg Sp)
    , OpCall Bare_addr_to_num
    ]

  where
    err = error (printf "Stage5.compileBuiltin: error: %s" (show b))
    oneArg f = \case [v] -> f v; _ -> err
    twoArgs f = \case [v1,v2] -> f v1 v2; _ -> err
    threeArgs f = \case [v1,v2,v3] -> f v1 v2 v3; _ -> err


setTemp :: SRC.Temp -> Source -> Op
setTemp temp source = OpStore (ATempSpace temp) source

compileRef :: SRC.Ref -> Source
compileRef = \case
    SRC.RefLitC c -> SLit (WChar c)
    SRC.RefLitN n -> SLit (WNum n)
    SRC.Ref _ loc -> do
    case loc of
      SRC.InGlobal g -> SLit (WAddr (AStatic (DataLabel g) 0))
      SRC.InFrame n -> SMemIndirectOffset frameReg (bytesPerWord * n)
      SRC.InTemp temp -> SMem (ATempSpace temp)
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
