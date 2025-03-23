-- | Locate identifier references at runtime; lift globals
module Stage3
  ( execute
  , compile
  ) where

import Interaction (Interaction(..))

{-import Builtin (Builtin,evalBuiltin)
import Control.Monad (ap,liftM)
import Data.List (intercalate)
import Data.Map (Map)
import Data.Set (Set,singleton,(\\),union)
import Interaction (Interaction(..))
import Lines (Lines,bracket,onHead,onTail,indented)
import Par4 (Position(..))
import Stage0 (evalLit,apply,Literal,Id(..))
import Stage1 (Ctag(..))
import Text.Printf (printf)
import Value (Value(..),deUnit)
import qualified Data.Map as Map
import qualified Data.Set as Set (toList,fromList,unions,empty)
-}
import qualified Stage2 as SRC (Code(..),execute)

type Transformed = Code

data Code = Code SRC.Code

----------------------------------------------------------------------
-- Show

instance Show Code where show (Code s2) = show s2

----------------------------------------------------------------------
-- Execute

execute :: Transformed -> Interaction
execute (Code s2) = SRC.execute s2

----------------------------------------------------------------------
-- Compile

compile :: SRC.Code -> Transformed
compile c = Code c
