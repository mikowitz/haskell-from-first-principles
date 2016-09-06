{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleInstances #-}

module LogicGoats where

class TooMany a where
  tooMany :: a -> Bool

instance TooMany Int where
  tooMany n = n > 42

instance TooMany [Char] where
  tooMany s = s > "forty-two"

instance TooMany (Int, String) where
  tooMany (i, s) = tooMany i

newtype Goats = Goats Int deriving (Eq, Show, TooMany)
newtype Flock = Flock (Int, String) deriving (Eq, Show, TooMany)

instance TooMany (Int, Int) where
  tooMany (i, i') = tooMany $ i + i'
