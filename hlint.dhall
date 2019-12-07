let hlint = ./constructors.dhall

let recursion = ./recursion.dhall

let fixity = ./fixity.dhall

let bannedFunctions =
      [ hlint.functions { functions = [ hlint.globalBan "fromJust" ] } ]

in  fixity.defFixities # bannedFunctions # recursion
