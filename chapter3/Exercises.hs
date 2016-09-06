module Chapter3Exercises where

exclaim :: String -> String
exclaim = (++"!")

fifthLetter :: String -> String
fifthLetter x = x !! 4 : ""

lastWord :: String -> String
lastWord x = last $ words x

thirdLetter :: String -> Char
thirdLetter x = x !! 2

letterIndex :: Int -> Char
letterIndex x = "Michael Rowe Berkowitz" !! x

rvrs :: String -> String
rvrs x = concat [a, " ", i, " ", c]
  where c = take 5 x
        i = take 2 $ drop 6 x
        a = drop 9 x
