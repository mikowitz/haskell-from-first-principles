module Page284 where

tensDigit :: Integral a => a -> a
tensDigit x = d
  where xLast = x `div` 10
        d     = xLast `mod` 10

tensDigit' :: Integral a => a -> a
tensDigit' x = d
  where (d', _) = divMod x 10
        d       = mod d' 10

hunsD :: Integral a => a -> a
hunsD x = d
  where (d', _) = divMod x 100
        d = mod d' 10

hunsD' :: Integral a => a -> a
hunsD' x = d
  where d = tensDigit' . (`div` 10) $ x

foldBool :: a -> a -> Bool -> a
foldBool x y b =
  case b of
    True  -> x
    False -> y

foldBool' :: a -> a -> Bool -> a
foldBool' x y b
  | b == True = x
  | otherwise = y

g :: (a -> b) -> (a, c) -> (b, c)
g f (x, y) = (f x, y)
