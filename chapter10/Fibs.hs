module Fibs where

fibs = takeWhile (<100) $ 1 : scanl (+) 1 fibs

fibsN x = fibs !! x

factorial = 1 : scanl (*) 2 [3..]

factN x = take x factorial

f = factN 5
