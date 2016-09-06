module Vignere where

import Data.Char

lowercaseOffset :: Int
lowercaseOffset = 97

shift :: Char -> Int -> Char
shift ' ' _ = ' '
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

shiftPair :: (Char, Char) -> Char
shiftPair (' ',' ') = ' '
shiftPair (a,b)     = shift a (ord b - lowercaseOffset)

vignere :: String -> String -> String
vignere x y = map shiftPair $ makePairs x (cycle y)

makePairs :: String -> String -> [(Char, Char)]
makePairs "" _          = []
makePairs _ ""          = []
makePairs (' ':xs) ys   = (' ',' '):makePairs xs ys
makePairs (x:xs) (y:ys) = (x,y):makePairs xs ys
