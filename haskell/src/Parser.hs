module Parser (parseProg) where

import Data.Word (Word16)
import Stage0 (Prog,Exp,Id,Arm,Cid,Bid(..))
import Stage0 (cUnit,cFalse,cTrue,cNil,cCons,mkUserId)
import Par4 (Par,noError,skip,alts,opt,many,some,sat,separated,position,Position(..))
import Text.Printf (printf)
import qualified Data.Char as Char (isAlpha,isNumber,isLower,isUpper)
import qualified Stage0 as AST
import qualified Par4

parseProg :: String -> Prog
parseProg = Par4.parse gram6

mkAbstraction :: [Bid] -> Exp -> Exp
mkAbstraction xs e = case xs of [] -> e; x@(Bid pos _):xs -> AST.Lam pos x (mkAbstraction xs e)

mkApps :: Exp -> [(Position,Exp)] -> Exp
mkApps f es = case es of [] -> f; (pos,e):es -> mkApps (AST.App f pos e) es

underscore :: Id
underscore = mkUserId "_"

positioned :: Par a -> Par (Position,a)
positioned par = do
  pos <- position
  x <- par
  pure (pos,x)

gram6 :: Par Prog
gram6 = program where

  keywords = ["let","in","if","then","else","fun","match","with","rec","true","false","type","of"]

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

  nibble par = do
    x <- par
    whitespace
    pure x

  -- nibbling from here...

  isVariableChar1 c = Char.isLower c || c == '_'
  isConstructorChar1 c = Char.isUpper c
  isIdentifierChar c = Char.isNumber c || Char.isAlpha c || c `elem` "'_"

  tvar = nibble $ do
    lit '\''
    _xs <- some $ sat isIdentifierChar
    pure ()

  key s =
    if all isIdentifierChar s && s `notElem` keywords
    then error (printf "Add \"%s\" to keywords list" s)
    else nibble (noError (mapM_ lit s))

  bracketedInfixName = nibble $ noError $ do
    lit '('
    s <- alts [ noError $ do mapM_ lit name; pure name
              | name <- infixNames ]
    lit ')'
    pure (mkUserId s)

  identifier = mkUserId <$> noError name
    where
      name = do
        x <- sat isVariableChar1
        xs <- many $ sat isIdentifierChar
        let s = x:xs
        if s `elem` keywords then fail else nibble (pure s)

  constructor0 = AST.Cid <$> do
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

  number = nibble $ alts [decNumber]

  charLitPlain = sat $ \c -> c /= '\\'

  charLitEscaped = do
    lit '\\'
    alts
      [ do lit '\\'; pure '\\'
      , do lit 'n'; pure '\n'
      , do lit '"'; pure '"'
      ]

  singleQuote = lit '\''
  charLit = nibble $ do
    singleQuote
    x <- alts [charLitEscaped, charLitPlain]
    singleQuote
    pure x

  stringLitChar = sat $ \c -> c /= '"' && c /= '\\'
  doubleQuote = lit '"'
  stringLit = nibble $ do
    doubleQuote
    x <- many (alts [charLitEscaped, stringLitChar])
    doubleQuote
    pure x

  openClose = noError $ do
    key "("
    key ")"

  bracketed thing = do
    key "("
    x <- thing
    key ")"
    pure x

  identOrUnit :: Par Id =
    alts [identifier
         , do openClose; pure underscore
         ]

  -- patterns...

  nilPat = do
    key "["
    key "]"
    pure (cNil,[])

  consPat = do
    x <- bound identOrUnit
    key "::"
    xs <- bound identOrUnit
    pure (cCons,[x,xs])

  tupleId :: Par [Bid] =
    alts [ bracketed (separated (key ",") (bound identOrUnit))
         , do x <- bound identOrUnit; pure [x]
         , pure []
         ]

  constructedPat = do
    c <- constructor
    xs <- tupleId
    pure (c,xs)

  pat :: Par (Cid, [Bid]) =
    alts [nilPat,consPat,constructedPat]

  -- expressions...

  var = do
    pos <- position
    x <- alts [identifier,bracketedInfixName]
    pure (AST.Var pos x)

  positionedLit = do
    pos <- position
    lit <- alts
      [ AST.LitN <$> number
      , AST.LitC <$> charLit
      , AST.LitS <$> stringLit
      ]
    pure $ AST.Lit pos lit

  unit = do
    pos <- position
    openClose
    pure (AST.Con pos cUnit [])

  literal = alts [positionedLit,unit]

  tupleExp :: Par [Exp] =
    bracketed (separated (key ",") exp)

  listExp = do
    openPos <- position
    key "["
    alts [ do key "]"; pure $ AST.Con openPos cNil []
         , do
             elems <- separated (key ";") (positioned expITE)
             closePos <- position
             key "]"
             let
               mkList :: [(Position,Exp)] -> Exp
               mkList = \case
                 [] -> AST.Con closePos cNil []
                 (pos,e1):es -> AST.Con pos cCons [e1,mkList es]
             pure (mkList elems)
         ]

  consApp = do
    pos <- position
    c <- constructor
    alts
      [ do es <- tupleExp; pure (AST.Con pos c es)
--      , do e <- atom0; pure (AST.Con c [e]) -- TODO: How to make this work?
      , pure (AST.Con pos c [])
      ]

  atom = alts [literal,var,listExp,bracketed exp,consApp]

  application = do
    let loop f = alts [ pure f , do p <- position; e <- atom; loop (AST.App f p e)]
    atom >>= loop

  infixOp names sub = sub >>= loop where
    loop acc =
      alts [ pure acc
           , do
               p1 <- position
               name <- alts [ do key x; pure x | x <- names ]
               p2 <- position
               x <- sub
               loop (mkApps (AST.Var p1 (mkUserId name)) [(p1,acc),(p2,x)])
           ]

  infixNames = infixGroup1 ++ infixGroup2 ++ infixGroup3 ++ infixGroup4

  infixGroup1 = ["*","%","/"]
  infixGroup2 = ["+","-"]
  infixGroup3 = ["::"]
  infixGroup4 = ["=","<=","<",">=",">"]

  infix0 = application
  infix1 = infixOp infixGroup1 infix0
  infix2 = infixOp infixGroup2 infix1
  infix3 = infixOp infixGroup3 infix2
  infix4 = infixOp infixGroup4 infix3

  infixWeakestPrecendence = infix4

  bound :: Par Id -> Par Bid
  bound identPar = do
    pos <- position
    x <- identPar
    pure (Bid pos x)

  bindingAbstraction = do
    xs <- many (bound identOrUnit)
    key "="
    e <- exp
    pure (mkAbstraction xs e)

  binding :: Par (Bid,Exp) = do
    key "let"
    pos <- position
    alts [do key "rec"; pure True, pure False] >>= \case
      True -> do
        f <- bound $ alts [identifier,bracketedInfixName]
        x1 <- bound identOrUnit
        rhs <- bindingAbstraction
        pure (f, AST.RecLam pos f x1 rhs)
      False -> do
        f <- bound $ alts [identOrUnit,bracketedInfixName]
        rhs <- bindingAbstraction
        pure (f,rhs)

  let_ = do
    pos <- position
    (x,rhs) <- binding
    key "in"
    body <- exp
    pure (AST.Let pos x rhs body)

  ite = do
    pos <- position
    key "if"
    i <- exp
    key "then"
    t <- exp
    key "else"
    e <- exp
    pure (AST.Case pos i [AST.Arm cTrue [] t, AST.Arm cFalse [] e ])

  abstraction = do
    key "fun"
    xs <- some (bound identOrUnit)
    key "->"
    e <- exp
    pure (mkAbstraction xs e)

  arm :: Par Arm = do
    key "|"
    (c,xs) <- pat
    key "->"
    e <- exp
    pure (AST.Arm c xs e)

  match_ = do
    pos <- position
    key "match"
    e <- exp
    key "with"
    as <- many arm
    pure (AST.Case pos e as)

  expITE = alts
    [ infixWeakestPrecendence
    , ite ]

  expSEQ = do
    e1 <- expITE
    alts [ do pos <- position
              key ";"
              e2 <- exp
              pure (AST.Let pos (Bid pos underscore) e1 e2)
         , pure e1
         ]

  exp = alts
    [ expSEQ
    , abstraction
    , match_
    , let_
    ]

  value_def = do
    (x,rhs) <- binding
    pure (AST.ValDef x rhs)

  -- types and typedefs: mostly skipped

  type_constructor :: Par () = do
    _ <- identifier
    pure ()

  atomic_type = alts
    [ do
        _ <- tvar
        _ <- opt type_constructor
        pure ()
    , do
        _ <- constructor; pure ()
    ]

  type_ = do
    separated (key "*") atomic_type

  maybe_tvar_seq =
    alts [ tvar
         -- , bracketed (separated (key ",")) tvar -- TODO: when we have an example
         , pure ()
         ]

  of_type = do
    key "of"
    type_

  type_def_arm = do
    cid <- constructor
    _ <- opt of_type
    pure cid

  type_def = do
    key "type"
    maybe_tvar_seq
    type_constructor
    key "="
    cids <- separated (key "|") type_def_arm
    pure (AST.TypeDef cids)

  definition = alts [value_def,type_def]

  program = do
    whitespace
    ds <- many definition
    pure $ AST.Prog ds
