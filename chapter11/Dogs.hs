module Dogs where

data Doggies a =
  Husky a
    | Mastiff a
    deriving (Eq, Show)

