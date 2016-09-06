module CasePractice where

functionC :: (Ord a) => a -> a -> a
functionC x y = if (x > y) then x else y

functionC' :: (Ord a) => a -> a -> a
functionC' x y =
  case check of
    True  -> x
    False -> y
  where check = x > y

ifEvenAdd2 :: (Integral a) => a -> a
ifEvenAdd2 n = if even n then (n+2) else n

ifEvenAdd2' :: (Integral a) => a -> a
ifEvenAdd2' n =
  case even n of
    True  -> n + 2
    False -> n

nums :: (Num a, Ord a) => a -> Integer
nums x =
  case compare x 0 of
    LT -> -1
    GT -> 1
    EQ -> 0
