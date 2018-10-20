    let hlint = ./constructors.dhall

in  let type = ./Type.dhall

in  let map =
          https://raw.githubusercontent.com/dhall-lang/Prelude/master/List/map

in  let mkFixity = λ(decl : Text) → hlint.fixity { fixity = decl }

in  let mkFixityList = λ(decls : List Text) → map Text type.Hint mkFixity decls

in  let arrowFixity =
          mkFixityList
          [ "infixr 3 ***", "infixr 3 &&&", "infixr 2 +++", "infixr 2 |||" ]

in  let monadFixity = mkFixityList [ "infixr 1 <=<" ]

in  let composeFixity =
          mkFixityList
          [ "infixr 8 .*"
          , "infixr 8 .**"
          , "infixr 8 .***"
          , "infixr 8 .****"
          , "infixr 8 -.*"
          , "infixr 8 -.**"
          , "infixr 8 -.***"
          , "infixr 8 -.****"
          , "infixl 8 -\$"
          , "infixl 8 ~@~"
          ]

in  let applicativeFixity =
          mkFixityList
          [ "infixl 4 *>", "infixl 4 <*", "infixl 3 <|>", "infixl 4 <**>" ]

in  let functorFixity =
          mkFixityList [ "infixl 4 <\$", "infixl 4 \$>", "infixl 1 <&>" ]

in  { mkFixity =
        mkFixity
    , arrowFixity =
        arrowFixity
    , monadFixity =
        monadFixity
    , applicativeFixity =
        applicativeFixity
    , composeFixity =
        composeFixity
    , defFixities =
        arrowFixity # monadFixity # functorFixity # applicativeFixity
    }
