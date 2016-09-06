module GettingThere where

data ThereYet = There Integer Float String Bool
  deriving (Eq, Show)

nope :: Float -> String -> Bool -> ThereYet
nope = There 10

notYet :: String -> Bool -> ThereYet
notYet = nope 25.5

notQuite :: Bool -> ThereYet
notQuite = notYet "yassss"

yassss :: ThereYet
yassss = notQuite True
