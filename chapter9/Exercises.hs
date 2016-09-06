module Chapter9Exercises where

import Data.Char (isUpper, toUpper)

takeUppercase :: String -> String
takeUppercase = filter isUpper

capitalize :: String -> String
capitalize "" = ""
capitalize (x:xs) = toUpper x:xs

upperCase :: String -> String
upperCase "" = ""
upperCase (x:xs) = toUpper x:upperCase xs

capFirst :: String -> Char
capFirst = toUpper . head


myAnd :: [Bool] -> Bool
myAnd []     = True
myAnd (x:xs) = x && myAnd xs

myOr :: [Bool] -> Bool
myOr []     = False
myOr (x:xs) = x || myOr xs

myAny :: (a -> Bool) -> [a] -> Bool
myAny _ []     = False
myAny f (x:xs) = f x || myAny f xs

myElem :: (Eq a) => a -> [a] -> Bool
myElem _ [] = False
myElem x (y:ys) = x == y || myElem x ys

myElem' :: (Eq a) => a -> [a] -> Bool
myElem' x = myAny (==x)

myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = myReverse xs ++ [x]

squish :: [[a]] -> [a]
squish [] = []
squish (x:xs) = x ++ squish xs

squishMap :: (a -> [b]) -> [a] -> [b]
squishMap _ [] = []
squishMap f (x:xs) = f x ++ squishMap f xs

squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy _ [x] = x
myMaximumBy f (x:y:xs) =
  case f x y of
    GT -> x
    _  -> myMaximumBy f (y:xs)

myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy _ [x] = x
myMinimumBy f (x:y:xs) =
  case f x y of
    LT -> x
    _  -> myMinimumBy f (y:xs)

myMaximum :: (Ord a) => [a] -> a
myMaximum = myMaximumBy compare

myMinimum :: (Ord a) => [a] -> a
myMinimum = myMinimumBy compare
