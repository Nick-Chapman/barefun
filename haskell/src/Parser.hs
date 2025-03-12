module Parser (parse1) where

import Exp1 (Exp,Id,Arm)
import Par4 (Par,noError,alts,many,some,sat,separated,position,Position(..))
import Text.Printf (printf)
import Value (Cid(..))
import qualified Data.Char as Char (isAlpha,isNumber,isLower,isUpper)
import qualified Exp1 as AST
import qualified Par4

-- TODO: infixes --oh, we do have some
-- TODO: comments
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
      [] -> AST.App main noPos mkUnit
      Def x rhs : ds -> AST.Let x rhs (flatten ds e)

mkUnitC,mkTrue,mkFalse :: Cid -- TODO: builtin cids shoiuld not be here
mkUnitC = Cid "Unit"
mkTrue = Cid "True"
mkFalse = Cid "False"

data Prog = Prog [Def]
data Def = Def Id Exp

mkUnit :: Exp
mkUnit = AST.Con mkUnitC []

mkAbstraction :: [Id] -> Exp -> Exp
mkAbstraction xs e = case xs of [] -> e; x:xs -> AST.Lam x (mkAbstraction xs e)

mkApps :: Exp -> [(Position,Exp)] -> Exp
mkApps f es = case es of [] -> f; (pos,e):es -> mkApps (AST.App f pos e) es

mkIte :: Exp -> Exp -> Exp -> Exp
mkIte i t e = AST.Case i [AST.Arm mkTrue [] t, AST.Arm mkFalse [] e ]

mkChar :: Char -> Exp
mkChar c = AST.Lit (AST.LitC c)

gram6 :: Par Prog
gram6 = program where

  fail = alts []

  lit x = do _ <- sat (== x); pure ()
  white = alts [lit ' ',lit '\n'] -- TODO: tabs

  decDigit = alts [ do lit c; pure n | (c,n) <- zip "0123456789" [0..] ]
  hexDigit = alts [ do lit c; pure n | (c,n) <- zip "0123456789abcdef" [0..] ]

  whitespace = do _ <- many white; return ()

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

  -- TODO: allow true/false (keywords) as constructors
  constructor0 = Cid <$> do
    x <- sat isConstructorChar1
    xs <- many $ sat isIdentifierChar
    let s = x:xs
    nibble (pure s)

  constructor = alts
    [ constructor0
    , do key "true"; pure mkTrue
    , do key "false"; pure mkFalse
    ]

  decNumber = do
    foldl (\acc d -> 10*acc + d) (0::Int) <$> some decDigit

  hexNumber = noError $ do
    lit '0'
    lit 'x'
    foldl (\acc d -> 16*acc + d) 0 <$> some hexDigit

  _number = nibble $ alts [hexNumber,decNumber] -- TODO: reinstate

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

  stringLitChar = sat $ \c -> c /= '"' -- TODO: do escaped chars properly

  doubleQuote = lit '"'
  _string = nibble $ do  -- TODO: reinstate
    doubleQuote
    x <- many stringLitChar
    doubleQuote
    pure x

  openClose = noError $ do
    key "("
    key ")"

  -- identifier or unit-pattern
  pat :: Par Id =
    alts [identifier
         , do openClose; pure (AST.Id "_")
         ]

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

  --num = Num <$> number -- TODO reinstate
  --str = Str <$> string -- TODO reinstate
  char = mkChar <$> charLit
  unit = do openClose; pure mkUnit

  tuple_exp :: Par [Exp] =
    bracketed (separated (key ",") exp)

  consApp = do
    c <- constructor
    alts
      [ do es <- tuple_exp; pure (AST.Con c es)
      , pure (AST.Con c [])
      ]

  -- TODO: atom should include var
  atom = alts [consApp,char,unit,bracketed exp]

  atomOrVar = alts [atom,var]

  positionedAtomOrVar :: Par (Position,Exp) = do
    p <- position
    e <- atomOrVar
    pure (p,e)

  -- TODO: simplify this varOrApp nonsense
  varOrApp = do
    pos <- position
    x <- identifier
    let loop acc = alts [ do x <- positionedAtomOrVar; loop (x:acc)
                        , pure (mkApps (AST.Var (Just pos) x) (reverse acc))
                        ]
    alts [ do y <- positionedAtomOrVar; loop [y], pure (AST.Var (Just pos) x) ]

  atomOrApp = alts [atom,varOrApp,consApp]

  {-infixOp names sub = sub >>= loop where
    loop acc =
      alts [ pure acc
           , do
               name <- alts [ do key x; return x | x <- names ]
               x <- sub
               loop (mkAppsX (AST.Var Nothing (AST.Id name)) [acc,x])
           ]

  sum = infixOp ["+"] atomOrApp
  equal = infixOp ["==","<"] sum
  conj = infixOp ["&"] equal

  infixWeakestPrecendence = conj-}
  infixWeakestPrecendence = atomOrApp

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
