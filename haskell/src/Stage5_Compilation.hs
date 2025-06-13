-- | Compile Stage4(CCF) to Stage5(ASM)
module Stage5_Compilation
  ( compile
  -- calling conventions; used in stage5 emulator
  , bytesPerWord
  , frameReg,argReg,argOut
  , labelCurrentCont
  , codeReturn, flipArgSpace
  , overapp2for1SaveCode
  , overapp2for1RestoreLabel
  , overapp2for1RestoreCode

  , pap1of2SaveCode
  , pap1of2RestoreLabel
  , pap1of2RestoreCode
  , cmapInternal
  , finalCodeLabel

) where

import Primitive (Primitive)
import Control.Monad (ap,liftM)
import Data.Map (Map)
import Stage1_EXP (Ctag(..))
import Text.Printf (printf)
import Value (Number)
import qualified Primitive as SRC (Primitive(..))
import qualified Data.Map as Map
import qualified Stage4_CCF as SRC

import Stage5_ASM

----------------------------------------------------------------------
-- Calling conventions

bytesPerWord :: Int
bytesPerWord = 2

-- arg/frame in registers
frameReg,argReg,argOut :: Reg
frameReg = Bp
argReg = Si
argOut = Di

-- current continuation in memory
setCurrentCont :: Source -> Op
setCurrentCont = \case
  SReg reg -> OpStore cc reg
  source -> OpMany [ OpMove Ax source, OpStore cc Ax ]
  where cc = TMemOffset labelCurrentCont 0

getCurrentCont :: Source
getCurrentCont = SMemOffset labelCurrentCont 0

labelTemps :: DataLabel
labelTemps = DataLabelR "Temps"

labelCurrentCont :: DataLabel
labelCurrentCont = DataLabelR "CurrentCont"

-- "return" to the current continuation
codeReturn :: Code
codeReturn =
  Do (OpMany [ OpMove frameReg getCurrentCont
             , setCurrentCont (SMemIndirectOffset frameReg bytesPerWord)
             , OpMove Ax (SLit (LNum 1))
             ]) (Done (JumpIndirect frameReg))

-- "tail-call" the given source with N args (already setup argOut register)
codeTail :: Int -> Source -> Code
codeTail n source =
  doOps [ OpMove frameReg source
        , OpMove Ax (SLit (LNum (fromIntegral n)))
        ] (Done (JumpIndirect frameReg))

-- prelude for every code-block: flip the arg-spaces when entering a code block
flipArgSpace :: Op
flipArgSpace = OpExchange argReg argOut

cmapInternal :: Map CodeLabel Code
cmapInternal = Map.fromList
  [ (finalCodeLabel, finalCode)
  , (pap1of2RestoreLabel, pap1of2RestoreCode)
  , (overapp2for1RestoreLabel, overapp2for1RestoreCode)
  ]

finalCodeLabel :: CodeLabel
finalCodeLabel = CodeLabel 0 "FINAL"

overapp2for1RestoreLabel :: CodeLabel
overapp2for1RestoreLabel = CodeLabel 0 "OverApp2for1Restore"

pap1of2RestoreLabel :: CodeLabel
pap1of2RestoreLabel = CodeLabel 0 "Pap1of2Restore"

finalCode :: Code
finalCode = Do (OpCall Bare_halt) (error "finalCode;will have halterd")

----------------------------------------------------------------------
-- overapp/pap
-- Would be great to actually see this code in the compiled output,
-- Rather than being magic'ed into existence in the emulator.
-- And thus avoiding repeating it in runtime.asm

overapp2for1SaveCode :: Code
overapp2for1SaveCode = do
  let numOverArgs = 1
  let indexOfFirstOverArg = 1
  let numWordsForDesc = numOverArgs + 1 + 1 -- the over-args; the current-cont; the restore code pointer
  let heapBytesNeeded = bytesPerWord * (numWordsForDesc + 1)
  let desc = BlockDescriptor Scanned (bytesPerWord * numWordsForDesc)
  Do (OpMany [ MacroHeapCheck { heapBytesNeeded } -- TODO prefer doOPs to OpMany
             , OpPush (SMemIndirectOffset argReg (bytesPerWord * indexOfFirstOverArg))
             , OpPush getCurrentCont
             , OpPush (SLit (LCodeLabel overapp2for1RestoreLabel))
             , setCurrentCont (SReg Sp)
             , OpPush (SLit (LBlockDescriptor desc)) -- pushed *after* Sp is read
             ]) Fallthrough

overapp2for1RestoreCode :: Code
overapp2for1RestoreCode = do
  let firstContFrammeIndex = 2
  let firstArgIndex = 0
  doOps [ flipArgSpace
        , setArgOut (firstArgIndex+0) (compileLoc (SRC.InFrame firstContFrammeIndex))
        ] (codeTail 1 (compileLoc (SRC.TheArg 0)))

pap1of2SaveCode :: Code
pap1of2SaveCode = do
  let numPassedArgs = 1
  let numWordsForDesc = numPassedArgs + 1 + 1 -- the over-args; the function; the restore code pointer
  let heapBytesNeeded = bytesPerWord * (numWordsForDesc + 1)
  let desc = BlockDescriptor Scanned (bytesPerWord * numWordsForDesc)
  doOps [ MacroHeapCheck { heapBytesNeeded }
        , OpPush (SMemIndirectOffset argReg (bytesPerWord * 0)) -- save passed arg-0
        , OpPush (SReg frameReg) -- save this func
        , OpPush (SLit (LCodeLabel pap1of2RestoreLabel))
        , setArgOut 0 (SReg Sp)
        , OpPush (SLit (LBlockDescriptor desc)) -- pushed *after* Sp is read
        ] codeReturn

pap1of2RestoreCode :: Code
pap1of2RestoreCode = do
  doOps [ flipArgSpace
        , setArgOut 0 (compileLoc (SRC.InFrame 2))
        , setArgOut 1 (compileLoc (SRC.TheArg 0))
        ] (codeTail 2 (compileLoc (SRC.InFrame 1)))


----------------------------------------------------------------------
-- Compile

type Transformed = Image

-- Ax is the general scratch register
-- Bx is used for case-scrutinee

compile :: SRC.Image -> Transformed
compile x =
  runAsm (compileImage x >>= cutEntryCode 0 "Start")

compileImage :: SRC.Image -> Asm Code
compileImage = \case
  SRC.Run code -> compileCode code
  SRC.LetTop (id,global) rhs body -> do
    let who = show (id,global)
    vals <- compileTopDef who rhs
    CutData (DataLabelG global) vals
    compileImage body

compileTopDef :: String -> SRC.Top -> Asm [DataSpec]
compileTopDef who = \case
  SRC.TopPrim prim xs -> error (show ("Unexpected TopPrim (a Pure Primitive did not get inlined)",prim,xs))
  SRC.TopLitS string -> pure (DW [ lnumTagging (fromIntegral $ length string) ] : [ DS string ])

  SRC.TopLam _x body -> do
    codeLabel <- compileCode body >>= cutEntryCode 1 ("Function: " ++ who)
    let w1 = LCodeLabel codeLabel
    pure [DW [w1]]

  SRC.TopLam2 x1 x2 body -> do
    codeLabel <- compileCode body >>= cutEntryCode 2 ("Function: " ++ who ++ show [x1,x2])
    let w1 = LCodeLabel codeLabel
    pure [DW [w1]]

  SRC.TopConApp (Ctag _ tag) xs -> do
    pure [DW (lnumTagging tag : map compileTopRef xs)]

compileTopRef :: SRC.Ref -> Lit
compileTopRef = \case
    SRC.RefLitC c -> LChar c
    SRC.RefLitN n -> lnumTagging n
    SRC.Ref _ loc -> do
    case loc of
      SRC.InGlobal g -> LStatic (DataLabelG g)
      _ -> error "compileTopRef"

cutEntryCode :: Int -> String -> Code -> Asm CodeLabel
cutEntryCode desiredNumArgs name code = do
  heapBytesNeeded <- Needed code
  CutCode name $ do
    doOps [ flipArgSpace
          , MacroArgCheck { desiredNumArgs }
          , MacroHeapCheck { heapBytesNeeded }
          ] code

compileCode :: SRC.Code -> Asm Code
compileCode = \case
  SRC.Return _pos res -> do
    pure $ Do (setArgOut 0 (compileRef res)) codeReturn

  SRC.Tail fun _pos arg -> do
    pure $ doOps
      [ setArgOut 0 (compileRef arg)
      ] (codeTail 1 (compileRef fun))

  SRC.Tail2 fun _pos arg1 arg2 -> do
    pure $ doOps
      [ setArgOut 0 (compileRef arg1)
      , setArgOut 1 (compileRef arg2)
      ] (codeTail 2 (compileRef fun))

  SRC.TailPrim SRC.MakeBytes _pos arg -> do
    pure $ doOps
      [ setArgOut 0 (compileRef arg)
      , OpMove Ax (SLit (LNum 1))
      ] (Done (JumpBare AllocBare_make_bytes))

  SRC.TailPrim prim _pos _arg ->
    error (printf "Stage5.compileCode/TailPrim: unexpected primitive: %s" (show prim))

  SRC.LetAtomic (id,temp) rhs body -> do
    let who = show (id,temp)
    let target = targetOfTemp temp
    ops <- compileAtomicTo who target rhs
    doOps ops <$> compileCode body

  SRC.PushContinuation pre _post (_x,later) first -> do
    lab <- compileCode later >>= cutEntryCode 1 "Continuation"
    let
      desc = BlockDescriptor Scanned (2 * (length pre + 2))
    let
      ops =
        map OpPush (reverse (map compileRef pre)) ++
        [ OpPush getCurrentCont
        , OpPush (SLit (LCodeLabel lab))
        , setCurrentCont (SReg Sp)
        , OpPush (SLit (LBlockDescriptor desc)) -- pushed *after* Sp is read
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

setArgOut :: Int -> Source -> Op
setArgOut i source = setTarget (TRegIndirectOffset argOut (i * bytesPerWord)) source

compileArm :: Reg -> SRC.Arm -> Asm [Op]
compileArm scrutReg arm =  do
  let (SRC.ArmTag pos (Ctag _ n) _xs _rhs) = arm
  code <- compileArmTaken scrutReg arm
  lab <- CutCode ("Arm: " ++ show pos) code
  pure [ OpCmp (SMemIndirectOffset scrutReg 0) (SLit (lnumTagging n))
       , OpBranchFlagZ lab
       ]

compileArmTaken :: Reg -> SRC.Arm -> Asm Code
compileArmTaken scrutReg arm =  do
  let (SRC.ArmTag _pos _tag xs rhs) = arm
  doOps
    [ setTarget (targetOfTemp temp) (SMemIndirectOffset scrutReg (bytesPerWord * i))
    | (i,(_,temp)) <- zip [1..] xs
    ] <$> compileCode rhs

doOps :: [Op] -> Code -> Code
doOps ops c = foldr Do c ops

compileAtomicTo :: String -> Target -> SRC.Atomic -> Asm [Op]
compileAtomicTo who target = \case
  SRC.Prim prim xs -> pure (compilePrimitiveTo prim target (map compileRef xs))
  SRC.ConApp (Ctag _ tag) xs -> pure (compileConAppTo target tag xs)
  SRC.Lam pre _post _x0 body -> compileFunctionTo 1 who target pre body
  SRC.Lam2 pre _post _x0 _x1 body -> compileFunctionTo 2 who target pre body
  SRC.RecLam pre _post _f _x0 body -> compileFunctionTo 1 who target pre body
  SRC.RecLam2 pre _post _f _x0 _x1 body -> compileFunctionTo 2 who target pre body

compileConAppTo :: Target -> Number -> [SRC.Ref] -> [Op]
compileConAppTo target tag xs = do
  let desc = BlockDescriptor Scanned (2 * (length xs + 1))
  map OpPush (reverse (SLit (lnumTagging tag) : map compileRef xs)) ++
    [ setTarget target (SReg Sp)
    , OpPush (SLit (LBlockDescriptor desc)) -- pushed *after* Sp is read
    ]

compileFunctionTo :: Int -> String -> Target -> [SRC.Ref] -> SRC.Code -> Asm [Op]
compileFunctionTo expect who target freeVars body = do
  lab <- compileCode body >>= cutEntryCode expect ("Function: " ++ who)
  let desc = BlockDescriptor Scanned (2 * (length freeVars + 1))
  pure (
    map OpPush (reverse (map compileRef freeVars)) ++
    [ OpPush (SLit (LCodeLabel lab))
    , setTarget target (SReg Sp)
    , OpPush (SLit (LBlockDescriptor desc)) -- pushed *after* Sp is read
    ])

-- The target must always be assigned to satisfy GC invariants. Even when the resul is just unit "()"
-- So we don't forget, w take "Target" after "Primitive"; and push the lambda into each branch...
compilePrimitiveTo :: Primitive -> Target -> [Source] -> [Op]
compilePrimitiveTo prim = case prim of
  SRC.Noinline -> \target -> oneArg $ \s1 ->
    [ setTarget target s1
    ]
  SRC.PutChar -> \target -> oneArg $ \s1 ->
    [ OpMove Ax s1
    , OpCall Bare_put_char
    , setTarget target sUnit -- .. so missing this line is a unused ident error.
    ]
  SRC.GetChar -> \target -> oneArg $ \_unit ->
    [ OpCall Bare_get_char
    , setTarget target (SReg Ax)
    ]
  SRC.EqChar -> \target -> twoArgs $ \s1 s2 ->
    [ OpMove Ax s1
    , OpCmp (SReg Ax) s2
    , OpCall Bare_make_bool_from_z
    , setTarget target (SReg Ax)
    ]
  SRC.AddInt -> \target -> twoArgs $ \s1 s2 ->
    [ OpMove Ax s1
    , OpMove Bx s2
    , OpAdd Ax (SReg Bx)
    , opDec Ax
    , setTarget target (SReg Ax)
    ]
  SRC.SubInt -> \target -> twoArgs $ \s1 s2 ->
    [ OpMove Ax s1
    , OpMove Bx s2
    , OpSub Ax (SReg Bx)
    , opInc Ax
    , setTarget target (SReg Ax)
    ]
  SRC.MulInt -> \target -> twoArgs $ \s1 s2 -> -- TODO: improve tag manipulation
    [ OpMove Ax s1
    , opShiftR1 Ax
    ] ++
    case s2 of
      SReg s2Reg ->
        [ opShiftR1 s2Reg
        , OpMulAx s2Reg
        , opShiftL1 Ax
        , opInc Ax
        , setTarget target (SReg Ax)
        ]
      _ ->
        [ OpMove Bx s2
        , opShiftR1 Bx
        , OpMulAx Bx
        , opShiftL1 Ax
        , opInc Ax
        , setTarget target (SReg Ax)
        ]
  SRC.DivInt -> \target -> twoArgs $ \s1 s2 ->
    [ OpMove Ax s1
    , opShiftR1 Ax
    , OpMove Bx s2
    , opShiftR1 Bx
    , OpMove Dx (SLit (LNum 0))
    , OpDivModAxDx Bx
    -- quotiant already in Ax
    , opShiftL1 Ax
    , opInc Ax
    , setTarget target (SReg Ax)
    ]
  SRC.ModInt -> \target -> twoArgs $ \s1 s2 ->
    [ OpMove Ax s1
    , opShiftR1 Ax
    , OpMove Bx s2
    , opShiftR1 Bx
    , OpMove Dx (SLit (LNum 0))
    , OpDivModAxDx Bx
    -- remainder in Dx
    , opShiftL1 Dx
    , opInc Dx
    , setTarget target (SReg Dx)
    ]
  SRC.EqInt -> \target -> twoArgs $ \s1 s2 ->
    [ OpMove Ax s1
    , OpCmp (SReg Ax) s2
    , OpCall Bare_make_bool_from_z -- TODO: maybe remove/inline?
    , setTarget target (SReg Ax)
    ]
  SRC.LessInt -> \target -> twoArgs $ \s1 s2 ->
    [ OpMove Ax s1
    , OpCmp (SReg Ax) s2
    , OpCall Bare_make_bool_from_n -- TODO: maybe remove/inline?
    , setTarget target (SReg Ax)
    ]
  SRC.CharChr -> \target -> oneArg $ \s1 ->
    [ OpMove Ax s1
    , opShiftR1 Ax
    , OpCall Bare_num_to_char -- TODO: remove/inline
    , setTarget target (SReg Ax)
    ]
  SRC.CharOrd -> \target -> oneArg $ \s1 ->
    [ OpMove Ax s1
    , OpCall Bare_char_to_num -- TODO: remove/inline
    , opShiftL1 Ax
    , opInc Ax
    , setTarget target (SReg Ax)
    ]
  SRC.MakeRef -> \target -> oneArg $ \s1 ->
    let desc = BlockDescriptor Scanned 2 in
    [ OpPush s1
    , setTarget target (SReg Sp)
    , OpPush (SLit (LBlockDescriptor desc)) -- pushed *after* Sp is read
    ]
  SRC.DeRef -> \target -> oneArg $ \s1 ->
    [ OpMove Bx s1
    , setTarget target (SMemIndirectOffset Bx 0)
    ]
  SRC.SetRef -> \target -> twoArgs $ \s1 s2 ->
    [ OpMove Bx s1
    , OpMove Ax s2
    , OpStore (TRegIndirectOffset Bx 0) Ax
    , setTarget target sUnit
    ]
  SRC.MakeBytes -> error "stage5: MakeBytes can only be tail-called "
  SRC.SetBytes -> \target -> threeArgs $ \s1 s2 s3 ->
    [ OpMove Ax s1
    , OpMove Bx s2
    , OpMove Dx s3
    , opShiftR1 Bx
    , OpCall Bare_set_bytes -- TODO: remove/inline
    , setTarget target sUnit
    ]
  SRC.GetBytes -> codeForGetBytes
  SRC.StringIndex -> codeForGetBytes
  SRC.FreezeBytes -> \target -> oneArg $ \s1 ->
    -- null-imp; bytes/string have the same representation
    [ setTarget target s1
    ]
  SRC.ThawBytes -> \target -> oneArg $ \s1 ->
    -- null-imp; bytes/string have the same representation
    [ setTarget target s1
    ]
  SRC.StringLength -> \target -> oneArg $ \s1 ->
    [ OpMove Bx s1
    , setTarget target (SMemIndirectOffset Bx 0)
    ]
  SRC.Crash -> \_target -> oneArg $ \s1 ->
    [ OpMove Bx s1
    , OpCall Bare_crash
    -- no need to assign target; we wont return from Bare_crash
    ]
  SRC.LoadSec -> \target -> twoArgs $ \s1 s2 ->
    [ OpMove Dx s1
    , opShiftR1 Dx
    , OpMove Bx s2
    , OpCall Bare_load_sector
    , setTarget target sUnit
    ]
  SRC.StoreSec -> \target -> twoArgs $ \s1 s2 ->
    [ OpMove Dx s1
    , opShiftR1 Dx
    , OpMove Bx s2
    , OpCall Bare_store_sector
    , setTarget target sUnit
    ]
  SRC.FreeWords -> \target -> oneArg $ \_s1 ->
    [ OpCall Bare_free_words
    , opShiftL1 Ax
    , opInc Ax
    , setTarget target (SReg Ax)
    ]
  SRC.Init_interrupt_mode -> \target -> oneArg $ \_unit ->
    [ OpCall Bare_init_interrupt_mode
    , setTarget target (SReg Ax)
    ]
  SRC.Get_ticks -> \target -> oneArg $ \_unit ->
    [ OpCall Bare_get_ticks
    , opShiftL1 Ax
    , opInc Ax
    , setTarget target (SReg Ax)
    ]
  SRC.Wait_for_interrupt -> \target -> oneArg $ \_unit ->
    [ OpHlt
    , setTarget target sUnit
    ]
  SRC.Is_keyboard_ready -> \target -> oneArg $ \_unit ->
    [ OpCall Bare_is_keyboard_ready
    , OpCall Bare_make_bool_from_nz
    , setTarget target (SReg Ax)
    ]
  SRC.Get_keyboard_last_scancode -> \target -> oneArg $ \_unit ->
    [ OpCall Bare_get_keyboard_last_scancode
    , setTarget target (SReg Ax)
    ]

  where
    opInc r = OpAdd r one
    opDec r = OpSub r one
    opShiftL1 r = OpShiftL r one
    opShiftR1 r = OpShiftR r one
    one = SLit (LNum 1)

    codeForGetBytes = \target -> twoArgs $ \s1 s2 ->
      [ OpMove Ax s1
      , OpMove Bx s2
      , opShiftR1 Bx
      , OpCall Bare_get_bytes -- TODO: remove/inline
      , setTarget target (SReg Ax)
      ]

    oneArg f = \case [v] -> f v; _ -> err
    twoArgs f = \case [v1,v2] -> f v1 v2; _ -> err
    threeArgs f = \case [v1,v2,v3] -> f v1 v2 v3; _ -> err

    err = error (printf "Stage5.compilePrimitive: error: %s" (show prim))

    sUnit = SLit (LStatic dUnit)
    dUnit = DataLabelR "Bare_unit"

setTarget :: Target -> Source -> Op
setTarget target = \case
  SReg sreg -> OpStore target sreg
  -- TODO: can we also avoid use of Ax when storing literals?
  source -> OpMany [ OpMove Ax source, OpStore target Ax]

compileRef :: SRC.Ref -> Source
compileRef = \case
    SRC.RefLitC c -> SLit (LChar c)
    SRC.RefLitN n -> SLit (lnumTagging n)
    SRC.Ref _ loc -> compileLoc loc

compileLoc :: SRC.Location -> Source
compileLoc = \case
  SRC.InGlobal g -> SLit (LStatic (DataLabelG g))
  SRC.InFrame n -> SMemIndirectOffset frameReg (bytesPerWord * n)
  SRC.InTemp (SRC.Temp n) -> SMemOffset labelTemps (bytesPerWord * n)
  SRC.TheArg n -> SMemIndirectOffset argReg (bytesPerWord * n)
  SRC.TheFrame -> SReg frameReg

targetOfTemp :: SRC.Temp -> Target
targetOfTemp (SRC.Temp n) = TMemOffset labelTemps (bytesPerWord * n)

lnumTagging :: Number -> Lit
lnumTagging n = LNum (2 * n + 1)

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
  Needed :: Code -> Asm Int -- access to the lazy allocation-needed computation

runAsm :: Asm CodeLabel  -> Image
runAsm asm = finalImage
  where
    finalImage = loop state0 asm k0

    state0 = AsmState { u = 1 } -- first code label for user code starts at 1; 0 is for internal labels
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

      -- Compute bound on allocation needed for Bare_enter_check
      Needed code -> \k -> do
        k s (needC code)

    Image{cmap=finalCmap} = finalImage

    m :: Map CodeLabel Int
    m = Map.fromList [ (lab, needC code) | (lab,code) <- Map.toList finalCmap ]

    needL :: CodeLabel -> Int
    needL lab = maybe err id $ Map.lookup lab m
      where err = error (show ("needL",lab))

    needC :: Code -> Int
    needC = \case
      Do op code -> needOp (needC code) op
      Done{} -> 0
      Fallthrough{} -> error "need/Fallthrough"

    needOp :: Int -> Op -> Int
    needOp after = \case
      OpMany ops -> foldr (flip needOp) after ops
      OpPush{} -> 2 + after
      OpBranchFlagZ lab -> max after (needL lab)
      _ -> after

data AsmState = AsmState { u :: Int }
