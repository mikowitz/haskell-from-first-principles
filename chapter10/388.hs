module Page388 where

f :: String
f = foldr (\a b -> (take 3 a) ++ b) "" ["Pizza", "Apples", "Bananas"]
