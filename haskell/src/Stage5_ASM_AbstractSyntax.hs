-- | Define types for x86 assembly, and printer suitable for nasm
module Stage5_ASM_AbstractSyntax
  ( bytesPerWord
  , Reg(..), frameReg,argReg,contReg
  , Image(..)
  , Lit(..)
  , Code(..)
  , Op(..)
  , Jump(..)
  , BlockDescriptor(..)
  , Source(..)
  , Target(..)
  , BareBios(..)
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

-- Calling conventions:
frameReg,argReg,contReg :: Reg
frameReg = Bp
argReg = Dx
contReg = Cx

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
  | OpPushSAVE Source
  | OpPopRESTORE Reg
  | OpCmp Source Source -- the first source can't be [ax] - but [bx] is ok. what are the x86 rules?
  | OpBranchFlagZ CodeLabel
  | OpAddInto Reg Source
  | OpSubInto Reg Source
  | OpMulIntoAx Reg  -- ax := ax * sourceReg
  | OpDivModIntoAxDx Reg -- dx:ax / sourceReg. quotiant->ax, remainder->dx
  | OpEnterCheck Int -- macro

data Jump
  = JumpDirect CodeLabel
  | JumpReg Reg
  | JumpIndirect Reg

data Target
  = TReg Reg
  | TTemp SRC.Temp

data Source
  = SReg Reg
  | SLit Lit
  | STemp SRC.Temp
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

data BlockDescriptor -- TODO improve rep, have one variant with size field + scan/raw flag
  = Scanned { evenSizeInBytes :: Int }
  | RawData { evenSizeInBytes :: Int }
  | BrokenHeart
  deriving Eq

-- BareBios; primitive routines available to the compiled code
data BareBios
  -- Base_clear_screen -- TODO: expose to user code
  = Bare_halt
  | Bare_crash
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
    OpEnterCheck need -> printf "Bare_enter_check(%d)" need

instance Show Jump where
  show = \case
    JumpDirect c -> "jmp "  ++ show c
    JumpReg r -> "jmp "  ++ show r
    JumpIndirect r -> "jmp ["  ++ show r ++ "]"

instance Show Target where
  show = \case
    TReg r -> show r
    TTemp temp -> ppTemp temp

instance Show Source where
  show = \case
    SReg r -> show r
    SLit w -> show w
    STemp temp -> printf "[%s]" (ppTemp temp)
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
  show = \case
    Scanned n -> show n ++ " ;; scanned"
    RawData n -> show n ++ " ;; raw-data"
    BrokenHeart -> "[broken-heart]" -- TODO: should only be a runtime Word

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
      if (n < 32 || n > 126) then printf "\\x%02x" n else [c]
