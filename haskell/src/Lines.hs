
module Lines
  ( Lines
  , juxComma, bracket, bracketSquare, onHead, onTail, jux, indented
  , (<++), (++>), (>>>)
  ) where

type Lines = [String]

(<++) :: String -> Lines -> Lines
(<++) s xs = onHead (s++) xs

(++>) :: Lines -> String -> Lines
(++>) xs s = onTail (++s) xs

(>>>) :: String -> Lines -> Lines
(>>>) = indented

juxComma :: Lines -> Lines -> Lines
juxComma a b = jux (onTail (++",") a) b

bracket :: Lines -> Lines
bracket = onHead ("(" ++) . onTail (++ ")")

bracketSquare :: Lines -> Lines
bracketSquare = onHead ("[" ++) . onTail (++ "]")

onHead :: (String -> String) -> Lines -> Lines
onHead _ [] = error "onHead"
onHead f (x:xs) = f x : xs

onTail :: (String -> String) -> Lines -> Lines
onTail _ [] = error "onTail"
onTail f xs = (reverse . onHead f . reverse) xs

jux :: Lines -> Lines -> Lines
jux [x] [y] = [ x ++ " " ++ y ]
jux xs ys = xs ++ ys

indented :: String -> Lines -> Lines
indented hang = \case
  [] -> error "indented"
  [oneLine] -> [hang ++ " " ++ oneLine]
  lines -> [hang] ++ ["  " ++ line | line <- lines]
