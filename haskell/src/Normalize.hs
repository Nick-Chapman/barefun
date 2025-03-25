-- | Normalize using NbE...
module Normalize (normalize) where

{-import Builtin (Builtin,evalBuiltin)
import Control.Monad (ap,liftM)
import Data.List (intercalate)
import Data.Map (Map)
import Data.Set (Set,singleton,(\\),union)
import Interaction (Interaction(..))
import Lines (Lines,bracket,onHead,onTail,indented)
import Par4 (Position(..))
import Stage0 (evalLit,apply,Literal,Id(..),Name(GeneratedName))
import Stage1 (Ctag(..),provenanceExp)
import Text.Printf (printf)
import Value (Value(..),deUnit)
import qualified Data.Map as Map
import qualified Data.Set as Set (toList,fromList,unions,empty)
-}
import qualified Stage1 as SRC

type Transformed = SRC.Exp

----------------------------------------------------------------------
-- Normalize

normalize :: SRC.Exp -> Transformed
normalize e = undefined e
