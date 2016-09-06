module WordNumber where

import Data.List (intersperse)

digitToWord :: Int -> String
digitToWord 0 = "zero"
digitToWord 1 = "one"
digitToWord 2 = "two"
digitToWord 3 = "three"
digitToWord 4 = "four"
digitToWord 5 = "five"
digitToWord 6 = "six"
digitToWord 7 = "seven"
digitToWord 8 = "eight"
digitToWord 9 = "nine"

digits :: Int -> [Int]
digits n = loop n []
  where
    loop n acc
      | n < ten = n:acc
      | otherwise = loop (div n ten) (mod n ten:acc)
      where ten = 10

wordNumber :: Int -> String
wordNumber = concat . intersperse "-" . map digitToWord . digits
