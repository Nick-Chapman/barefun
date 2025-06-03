-- | Define types for x86 assembly, and printer suitable for nasm
module Stage5_ASM
  ( bytesPerWord
  , Reg(..), frameReg,argReg, getCurrentCont,setCurrentCont
  , Image(..)
  , Lit(..)
  , Code(..), codeReturn
  , Op(..)
  , Jump(..)
  , BlockDescriptor(..), ScanMode(..)
  , Source(..)
  , Target(..)
  , BareBios(..)
  , AllocBareBios(..)
  , CodeLabel(..)
  , DataLabel(..)
  , DataSpec(..)
  ) where

import Data.Char (ord)
import Data.List (intercalate)
import Data.Map (Map)
import Text.Printf (printf)
import Value (Number)
import qualified Data.Map as Map
import qualified Stage4_CCF as SRC

bytesPerWord :: Int
bytesPerWord = 2

data Reg = Ax | Bx | Cx | Dx | Sp | Bp | Si | Di
  deriving (Eq,Ord)

-- Calling conventions: arg/frame in registers
frameReg,argReg :: Reg
frameReg = Bp
argReg = Si

-- current continuation in memory
setCurrentCont :: Source -> Op
setCurrentCont = \case
  SReg reg -> OpStore TCurrentCont reg
  source -> OpMany [ OpMove Ax source, OpStore TCurrentCont Ax ]

getCurrentCont :: Source
getCurrentCont = SCurrentCont

-- this is the calling convention to "return" to the current continuation
codeReturn :: Code
codeReturn =
  Do (OpMany [ OpMove frameReg getCurrentCont
             , setCurrentCont (SMemIndirectOffset frameReg bytesPerWord)
             ]) (Done (JumpIndirect frameReg))

data Image = Image
  { cmap :: Map CodeLabel Code
  , dmap :: Map DataLabel [DataSpec]
  , start :: CodeLabel
  }

data DataSpec
  = DW [Lit]
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
  | OpCmp Source Source
  | OpBranchFlagZ CodeLabel
  | OpShiftL Reg Source
  | OpShiftR Reg Source
  | OpAdd Reg Source
  | OpSub Reg Source
  | OpMulAx Reg  -- ax := ax * sourceReg
  | OpDivModAxDx Reg -- dx:ax / sourceReg. quotiant->ax, remainder->dx
  | OpEnterCheck Int -- macro
  | OpHlt

data Jump
  = JumpReg Reg
  | JumpIndirect Reg
  | JumpBare AllocBareBios

data Target
  = TReg Reg
  | TTemp SRC.Temp -- TODO: unify TTemp/TCurrentCont as just TMem (same for Source)
  | TCurrentCont

data Source
  = SReg Reg
  | SLit Lit
  | STemp SRC.Temp
  | SCurrentCont
  | SMemIndirectOffset Reg Int -- byte indexing

data Lit
  = LChar Char
  | LNum Number
  | LStatic DataLabel
  | LCodeLabel CodeLabel
  | LBlockDescriptor BlockDescriptor

data CodeLabel = CodeLabel Int String -- unique label and provenance
  deriving (Eq,Ord)

data DataLabel
  = DataLabelG SRC.Global -- for user-code globals
  | DataLabelR String -- for runtime internals
  deriving (Eq,Ord)

data BlockDescriptor = BlockDescriptor { scanMode :: ScanMode, sizeInBytes :: Int }
  deriving (Eq)

data ScanMode = Scanned | RawData
  deriving (Eq)

-- BareBios; primitive routines available to the compiled code
data BareBios
  = Bare_halt
  | Bare_crash
  | Bare_put_char
  | Bare_get_char
  | Bare_make_bool_from_z
  | Bare_make_bool_from_nz
  | Bare_make_bool_from_n
  | Bare_num_to_char
  | Bare_char_to_num
  | Bare_set_bytes -- TODO: would be nice to have a declarative spec for arg-passing protocol, which is shared between compiler and emulator. And somehow to be used so runtime.asm is also consistent
  | Bare_get_bytes
  | Bare_load_sector
  | Bare_store_sector
  | Bare_free_words
  | Bare_init_interrupt_mode
  | Bare_get_ticks
  | Bare_is_keyboard_ready
  | Bare_get_keyboard_last_scancode
  deriving Show

-- AllocBareBios; primitive routines which may allocate, and must do their own heap-check
data AllocBareBios
  = AllocBare_make_bytes
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
    OpCmp r src -> "cmp word " ++ show r ++ ", " ++ show src
    OpBranchFlagZ lab ->  "jz " ++ show lab
    OpShiftL r s -> "shl " ++ show r ++ ", " ++ show s
    OpShiftR r s -> "sar " ++ show r ++ ", " ++ show s
    OpAdd r src -> "add " ++ show r ++ ", " ++ show src
    OpSub r src -> "sub " ++ show r ++ ", " ++ show src
    OpMulAx src -> "mul " ++ show src
    OpDivModAxDx src -> "Div " ++ show src
    OpEnterCheck need -> printf "Bare_enter_check(%d)" need
    OpHlt -> "hlt"

instance Show Jump where
  show = \case
    JumpReg r -> "jmp "  ++ show r
    JumpIndirect r -> "jmp ["  ++ show r ++ "]"
    JumpBare bare -> "jmp " ++ show bare

instance Show Target where
  show = \case
    TReg r -> show r
    TTemp temp -> ppTemp temp
    TCurrentCont -> "CurrentCont"

instance Show Source where
  show = \case
    SReg r -> show r
    SLit w -> show w
    STemp temp -> printf "[%s]" (ppTemp temp)
    SCurrentCont -> "[CurrentCont]"
    SMemIndirectOffset r n ->
      if n == 0 then printf "[%s]" (show r) else
        printf "[%s+%s]" (show r) (show n)

instance Show Lit where
  show = \case
    LChar c -> printf "`%s`" (escapeCharForNasm c)
    LNum n -> show n
    LStatic a -> show a
    LCodeLabel lab -> show lab
    LBlockDescriptor d -> show d

instance Show CodeLabel where show (CodeLabel n _) = "L" ++ show n

instance Show DataLabel where show = \case DataLabelG g -> show g; DataLabelR s -> s

instance Show BlockDescriptor where
  show BlockDescriptor{sizeInBytes,scanMode} =
    printf "%d ;; %s" sizeInBytes (show scanMode)

instance Show ScanMode where
  show = \case
    Scanned -> "scanned"
    RawData -> "raw-data"

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

ppTemp :: SRC.Temp -> String
ppTemp (SRC.Temp n) = printf "Temps+%d" (bytesPerWord * n)

escapeCharForNasm :: Char -> String
escapeCharForNasm c = do
  let n = ord c
  if c == '\n' then "\\n" else
    if c == '`' then "\\`" else
      if c == '\\' then "\\\\" else
        if (n < 32 || n > 126) then printf "\\x%02x" n else [c]
