module Chapter4Exercises where

awesome :: [String]
awesome = ["Papuchon", "curry", ":)"]

alsoAwesome :: [String]
alsoAwesome = ["Quake", "The Simons"]

allAwesome :: [[String]]
allAwesome = [awesome, alsoAwesome]

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x = x == reverse x

myAbs :: Integer -> Integer
myAbs x =
  if x < 0
     then -x
     else x

f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f x y = ((snd x, snd y), (fst x, fst y))

