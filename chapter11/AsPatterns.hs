module AsPatterns where

import Data.Char (toUpper)
import Data.List (intercalate)
import Data.List.Split (wordsBy)

isSubsequenceOf :: (Eq a) => [a] -> [a] -> Bool
isSubsequenceOf [] _ = True
isSubsequenceOf _ [] = False
isSubsequenceOf ax@(x:xs) (y:ys)
  | x == y = isSubsequenceOf xs ys
  | otherwise = isSubsequenceOf ax ys

capitalizeWords :: String -> [(String, String)]
capitalizeWords "" = []
capitalizeWords s = map mkTuple (words s)
  where
    mkTuple ax@(x:xs) = (ax, toUpper x:xs)

capitalizeWord :: String -> String
capitalizeWord "" = ""
capitalizeWord (' ':xs) = ' ':capitalizeWord xs
capitalizeWord (x:xs) = toUpper x:xs

capitalizeParagraph :: String -> String
capitalizeParagraph = ( (++".") . intercalate "." . map capitalizeWord . wordsBy (=='.'))


