{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module DataConstructors where

data Example = MakeExample deriving Show

data Example' = MakeExample' Int deriving Show

tooManyGoats :: Int -> Bool
tooManyGoats = (>42)

newtype Goats = Goats Int deriving (Eq, Show, TooMany)
newtype Cows  = Cows Int deriving (Eq, Show)

tooManyGoats':: Goats -> Bool
tooManyGoats' (Goats g) = g > 42

class TooMany a where
  tooMany :: a -> Bool

instance TooMany Int where
  tooMany n = n > 42


