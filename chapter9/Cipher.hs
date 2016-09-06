module Cipher where

import Data.Char

lowercaseOffset :: Int
lowercaseOffset = 97

shift :: Char -> Int -> Char
shift c i = alphabetize modded
  where
    newIndex = i + ord c
    zeroed = newIndex - lowercaseOffset
    modded = mod zeroed 26
    alphabetize = chr . (lowercaseOffset+)

caesar :: String -> Int -> String
caesar s i = map (`shift` i) s

unCaesar :: String -> Int -> String
unCaesar s i = caesar s (-i)

