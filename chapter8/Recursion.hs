module Recursion where

fibonacci :: Integral a => a -> a
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci x = fibonacci (x - 1) + fibonacci (x - 2)

data DivisionResult =
  Result Integer
    | DividedByZero
    deriving (Eq, Show)

dividedBy :: Integer -> Integer -> DivisionResult
dividedBy _ 0 = DividedByZero
dividedBy n d
  | d < 0 && n <= 0 = dividedBy (-n) (-d)
  | d < 0 = Result $ negate . fst $ loop n (-d) 0
  | n < 0 = Result $ negate . fst $ loop (-n) d 0
  | otherwise = Result $ fst $ loop n d 0
  where
    loop n d count
      | n < d     = (count, n)
      | otherwise = loop (n - d) d (count + 1)

main :: IO ()
main = do
  print (dividedBy 10 0 == DividedByZero)
  print (dividedBy 10 2 == Result 5)
  print (dividedBy 10 (-2) == Result (-5))
  print (dividedBy (-10) (-2) == Result 5)
  print (dividedBy (-10) 2 == Result (-5))

mc91 :: (Num a, Ord a) => a -> a
mc91 x
  | x > 100 = x - 10
  | otherwise = mc91 . mc91 $ x + 11
