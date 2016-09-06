module PoemLines where

myWords :: String -> [String]
myWords = splitOn ' '

myLines :: String -> [String]
myLines = splitOn '\n'


splitOn :: (Eq a) => a -> [a] -> [[a]]
splitOn x xs = loop xs []
  where
    loop xs' acc
      | xs' == [] = reverse acc
      | otherwise = loop (dropThrough x xs') (takeThrough x xs':acc)
      where
        dropThrough c = dropWhile (==c) . dropWhile (/=c)
        takeThrough c = takeWhile (/=c)

blake = "Tyger Tyger, burning bright\nIn the forests of the night\nWhat immortal hand or eye\nCould frame thy fearful symmetry?"

shouldEqual =
  [ "Tyger Tyger, burning bright",
    "In the forests of the night",
    "What immortal hand or eye",
    "Could frame thy fearful symmetry?" ]

main :: IO ()
main = do
  print (myLines blake == shouldEqual)
