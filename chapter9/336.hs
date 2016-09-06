module Page366 where

mySqr = [x^2 | x <- [1..5]]
myCube = [x^3 | x <- [1..5]]

sqrCubeTuples :: [(Integer, Integer)]
sqrCubeTuples = [(x, y) | x <- mySqr, y <- myCube]

tuplesLessThan50 :: [(Integer, Integer)]
tuplesLessThan50 = [(x, y) | (x, y) <- sqrCubeTuples, x < 50, y < 50]

countTuplesLessThan50 :: Int
countTuplesLessThan50 = length tuplesLessThan50

myLen :: [a] -> Integer
myLen [] = 0
myLen (_:xs) = 1 + myLen xs
