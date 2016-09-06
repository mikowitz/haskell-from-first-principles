module Page354 where

multsOf3 :: (Integral a) => [a] -> [a]
multsOf3 = filter (\x -> rem x 3 == 0)

countMultsOf3 :: (Integral a) => [a] -> Int
countMultsOf3 = length . multsOf3

myFilter :: String -> [String]
myFilter = filter (\y -> not $ elem y ["the", "a"]) . words


main :: IO ()
main = do
  print (myFilter "the brown dog was a goof")
