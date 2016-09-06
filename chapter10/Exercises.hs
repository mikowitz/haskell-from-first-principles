module Chapter10Exercises where

stops :: [Char]
stops = "pbtdkg"

vowels :: [Char]
vowels = "aeiou"

svsTuples :: [(Char, Char, Char)]
svsTuples = [(s, v, s') | s <- stops, v <- vowels, s' <- stops]

svsPTuples :: [(Char, Char, Char)]
svsPTuples = [(s, v, s') | s <- stops, v <- vowels, s' <- stops, s == 'p']

seekritFunc :: String -> Int
seekritFunc x =
  div (sum (map length (words x)))
      (length (words x))

seekritFunc' :: (Fractional a) => String -> a
seekritFunc' x =
  (/) ((fromIntegral . sum . map length . words) $ x)
      (fromIntegral . length . words $ x)

myOr :: [Bool] -> Bool
myOr = foldr (||) False

myAny :: (a -> Bool) -> [a] -> Bool
myAny f xs = foldr (||) False (map f xs)

myElem :: Eq a => a -> [a] -> Bool
myElem m xs = foldr (||) False (map (m==) xs)

myReverse :: [a] -> [a]
myReverse = foldl (flip (:)) []

myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr (\x acc -> f x:acc) []

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f = foldr (\x acc ->
  case f x of
    True -> x:acc
    False -> acc
                      ) []

squish :: [[a]] -> [a]
squish = foldr (\x acc -> x ++ acc) []

squishMap :: (a -> [b]) -> [a] -> [b]
squishMap f = foldr (\x acc -> f x ++ acc) []

squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy f (x:xs) = foldl firstIfGT x xs
myMaximumBy f (x':xs) = foldl (\acc x -> case f acc x of
                                           GT -> acc
                                           _ -> x
                              ) x' xs

myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy f (x':xs) = foldl (\acc x -> case f acc x of
                                          LT -> acc
                                          _ -> x
                             ) x' xs

