module Parser (parse1) where

import Data.Word (Word16)
import Exp1 (Exp,Id,Arm)
import Par4 (Par,noError,skip,alts,many,some,sat,separated,position,Position(..))
import Text.Printf (printf)
import Value (Cid(..),cUnit,cFalse,cTrue)
import qualified Data.Char as Char (isAlpha,isNumber,isLower,isUpper)
import qualified Exp1 as AST
import qualified Par4

-- TODO: type constraints
-- TODO: list syntax
-- TODO: semi colon syntax
-- TODO: example.fun -- use richer syntax when supported

parse1 :: String -> Exp
parse1 = Par4.parse (deProg <$> gram6)

deProg :: Prog -> Exp
deProg (Prog defs) = flatten defs main
  where
    noPos = Position 0 0
    main = AST.Var Nothing (AST.Id "main")
    flatten :: [Def] -> Exp -> Exp
    flatten ds e = case ds of
      [] -> AST.App main noPos (AST.Con cUnit [])
      Def x rhs : ds -> AST.Let x rhs (flatten ds e)

data Prog = Prog [Def]
data Def = Def Id Exp

mkAbstraction :: [Id] -> Exp -> Exp
mkAbstraction xs e = case xs of [] -> e; x:xs -> AST.Lam x (mkAbstraction xs e)

mkApps :: Exp -> [(Position,Exp)] -> Exp
mkApps f es = case es of [] -> f; (pos,e):es -> mkApps (AST.App f pos e) es

mkIte :: Exp -> Exp -> Exp -> Exp
mkIte i t e = AST.Case i [AST.Arm cTrue [] t, AST.Arm cFalse [] e ]

gram6 :: Par Prog
gram6 = program where

  fail = alts []

  lit x = do _ <- sat (== x); pure ()
  white1 = alts [lit ' ', lit '\n', lit '\t']

  next = sat (\_ -> True)

  comment = do
    noError $ do lit '('; lit '*'
    nest 0
    where
      nest :: Int -> Par ()
      nest i =
        next >>= \case
        '*' -> do next >>= \case ')' -> if i == 0 then pure () else nest (i-1); _ -> nest i
        '(' -> do next >>= \case '*' -> nest (i+1); _ -> nest i
        _ -> nest i

  whitespace = skip (alts [white1, comment])

  decDigit = alts [ do lit c; pure n | (c,n) <- zip "0123456789" [0..] ]
  --hexDigit = alts [ do lit c; pure n | (c,n) <- zip "0123456789abcdef" [0..] ]

  nibble par = do
    x <- par
    whitespace
    pure x

  -- nibbling from here...

  keywords = ["let","in","if","then","else","fun","match","with","rec","true","false"]

  isVariableChar1 c = Char.isLower c || c == '_'
  isConstructorChar1 c = Char.isUpper c
  isIdentifierChar c = Char.isNumber c || Char.isAlpha c || c `elem` "'_"

  key s =
    if all isIdentifierChar s && s `notElem` keywords
    then error (printf "Add \"%s\" to keywords list" s)
    else nibble (noError (mapM_ lit s))

  identifier = AST.Id <$> noError name
    where
      name = do
        x <- sat isVariableChar1
        xs <- many $ sat isIdentifierChar
        let s = x:xs
        if s `elem` keywords then fail else nibble (pure s)

  constructor0 = Cid <$> do
    x <- sat isConstructorChar1
    xs <- many $ sat isIdentifierChar
    let s = x:xs
    nibble (pure s)

  constructor = alts
    [ constructor0
    , do key "true"; pure cTrue
    , do key "false"; pure cFalse
    ]

  decNumber :: Par Word16 = foldl (\acc d -> 10*acc + d) 0 <$> some decDigit

  {-hexNumber = noError $ do
    lit '0'
    lit 'x'
    foldl (\acc d -> 16*acc + d) 0 <$> some hexDigit-}

  number = nibble $ alts [decNumber] -- hexNumber

  charLitPlain = sat $ \c -> c /= '\\' -- TODO only printable

  charLitEscaped = do
    lit '\\'
    alts
      [ do lit '\\'; pure '\\'
      , do lit 'n'; pure '\n'
      ]

  singleQuote = lit '\''
  charLit = nibble $ do
    singleQuote
    x <- alts [charLitPlain, charLitEscaped]
    singleQuote
    pure x

  --stringLitChar = sat $ \c -> c /= '"' -- TODO: do escaped chars properly
  {-doubleQuote = lit '"'
  _string = nibble $ do  -- TODO: string syntax
    doubleQuote
    x <- many stringLitChar
    doubleQuote
    pure x-}

  openClose = noError $ do
    key "("
    key ")"

  -- expression forms...

  bracketed thing = do
    key "("
    x <- thing
    key ")"
    pure x

  var = do
    x <- identifier
    pos <- position
    pure (AST.Var (Just pos) x)

  num = AST.Lit . AST.LitN <$> number
  char = AST.Lit . AST.LitC <$> charLit
  unit = do openClose; pure (AST.Con cUnit [])

  tuple_exp :: Par [Exp] =
    bracketed (separated (key ",") exp)

  consApp = do
    c <- constructor
    alts
      [ do es <- tuple_exp; pure (AST.Con c es)
      , pure (AST.Con c [])
      ]

  atom = alts [var,consApp,char,num,unit,bracketed exp]

  application = do
    let loop f = alts [ pure f , do p <- position; e <- atom; loop (AST.App f p e)]
    atom >>= loop

  infixOp names sub = sub >>= loop where
    loop acc =
      alts [ pure acc
           , do
               p1 <- position
               name <- alts [ do key x; return x | x <- names ]
               p2 <- position
               x <- sub
               loop (mkApps (AST.Var Nothing (AST.Id name)) [(p1,acc),(p2,x)])
           ]

  infix1 = infixOp ["%","/"] application
  infix2 = infixOp ["+"] infix1
  --infix3 = infixOp ["==","<"] infix2
  --infix4 = infixOp ["&"] infix3

  infixWeakestPrecendence = infix2

  -- identifier or unit-pattern
  pat :: Par Id =
    alts [identifier
         , do openClose; pure (AST.Id "_")
         ]

  bindingAbstraction = do
    xs <- many pat
    key "="
    bound <- exp
    pure (mkAbstraction xs bound)

  binding = do
    key "let"
    alts [do key "rec"; pure True, pure False] >>= \case
      True -> do
        f <- identifier
        x1 <- pat
        rhs <- bindingAbstraction
        pure (f, AST.RecLam f x1 rhs)
      False -> do
        f <- pat
        rhs <- bindingAbstraction
        pure (f,rhs)

  let_ = do
    (x,rhs) <- binding
    key "in"
    body <- exp
    pure (AST.Let x rhs body)

  ite = do
    key "if"
    i <- exp
    key "then"
    t <- exp
    key "else"
    e <- exp
    pure (mkIte i t e)

  abstraction = do
    key "fun"
    xs <- some pat
    key "->"
    e <- exp
    pure (mkAbstraction xs e)

  tuple_id :: Par [Id] =
    alts [ bracketed (separated (key ",") pat)
         , pure [] ]

  arm :: Par Arm = do
    key "|"
    c <- constructor
    xs <- tuple_id
    key "->"
    e <- exp
    pure (AST.Arm c xs e)

  match_ = do
    key "match"
    e <- exp
    key "with"
    as <- many arm
    pure (AST.Case e as)

  exp = alts [match_,abstraction,ite,let_,infixWeakestPrecendence]

  definition = do
    (x,rhs) <- binding
    return (Def x rhs)

  program = do
    whitespace
    defs <- many definition
    pure $ Prog defs
