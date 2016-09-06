module Numbers where

data Nat =
  Zero
    | Succ Nat
    deriving (Eq, Show)

natToInteger :: Nat -> Integer
natToInteger Zero = 0
natToInteger (Succ x) = succ . natToInteger $ x

integerToNat :: Integer -> Maybe Nat
integerToNat x
  | x < 0 = Nothing
  | otherwise = Just (integerToNat' x)

integerToNat' :: Integer -> Nat
integerToNat' 0 = Zero
integerToNat' x = Succ (integerToNat' (pred x))
