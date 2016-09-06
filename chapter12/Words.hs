module Words where

notThe :: String -> Maybe String
notThe "the" = Nothing
notThe s     = Just s

replaceThe :: String -> String
replaceThe = unwords . map theToA . words
  where
    theToA s = case notThe s of
                 Nothing -> "a"
                 Just x -> x

countTheBeforeVowel :: String -> Integer
countTheBeforeVowel s = go (words s)
  where
    go [x] = 0
    go (x:a@((h:_):xs))
      | x == "the" && elem h "aeiou" = 1 + go a
      | otherwise = go a

countVowels :: String -> Integer
countVowels = toInteger . length . filter isVowel

isVowel :: Char -> Bool
isVowel = flip elem "aeiou"

newtype Word' = Word' String deriving (Eq, Show)

vowels = "aeiou"

mkWord :: String -> Maybe Word'
mkWord s = case vowelCount > consonantCount of
             True -> Nothing
             False -> Just (Word' s)
  where
    vowelCount = length . filter isVowel $ s
    consonantCount = length . filter (not . isVowel) $ s



