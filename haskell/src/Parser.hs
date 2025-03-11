module Parser (parse1) where

import qualified Par4
import Par4 (Par,noError,alts,many,some,sat,separated,position,Position(..))
import qualified Data.Char as Char (isAlpha,isNumber,isLower,isUpper)
import Text.Printf (printf)

import qualified Exp1 as AST
import Exp1 (Exp,Id,Arm,Cid)

-- TODO: parse recursive bindings
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

mkUnitC,mkTrue,mkFalse :: Cid
mkUnitC = AST.Cid "Unit"
mkTrue = AST.Cid "True"
mkFalse = AST.Cid "False"

data Prog = Prog [Def]
data Def = Def Id Exp

mkUnit :: Exp
mkUnit = AST.Con mkUnitC []

mkDef :: Id -> [Id] -> Exp -> Def
mkDef f xs e = Def f (mkAbstraction xs e)

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

  keywords = ["let","in","if","then","else","fun","match","with"]

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

  constructor = AST.Cid <$> do
    x <- sat isConstructorChar1
    xs <- many $ sat isIdentifierChar
    let s = x:xs
    nibble (pure s)

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

  -- TODO: odd to allow unit-pattern here
  pat :: Par Id =
    alts [identifier, do openClose; pure (AST.Id "_")]

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

  cons0 :: Par Exp = do
    c <- constructor
    pure (AST.Con c [])

  -- TODO: atom should include var
  atom = alts [cons0,char,unit,bracketed exp]

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

  atomOrApp = alts [atom,varOrApp]

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

  tuple_exp :: Par [Exp] =
    bracketed (separated (key ",") exp)

  consApp = do
    c <- constructor
    es <- tuple_exp
    pure (AST.Con c es)

  let_ = do
    key "let"
    -- TODO: rec
    x <- pat
    formals <- many pat
    key "="
    rhs <- exp
    key "in"
    body <- exp
    pure (AST.Let x (mkAbstraction formals rhs) body)

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

  exp = alts [consApp,match_,abstraction,ite,let_,infixWeakestPrecendence]

  definition = do
    key "let"
    name <- identifier
    formals <- many pat
    key "="
    body <- exp
    return (mkDef name formals body)

  program = do
    whitespace
    defs <- many definition
    pure $ Prog defs
