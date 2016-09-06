module Database where

import Data.Time

data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate   UTCTime
                  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase =
  [ DbDate (UTCTime (fromGregorian 1911 5 1) (secondsToDiffTime 34123))
    , DbNumber 9001
    , DbString "Hello, world!"
    , DbDate (UTCTime (fromGregorian 1921 5 1) (secondsToDiffTime 34123))
  ]

filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate = foldr (\a b ->
  case a of
    DbDate time -> time:b
    _           -> b
                     ) []

filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber = foldr (\a b ->
  case a of
    DbNumber number -> number:b
    _               -> b
                       ) []

mostRecent :: [DatabaseItem] -> UTCTime
mostRecent = maximum . filterDbDate

sumDb :: [DatabaseItem] -> Integer
sumDb = sum . filterDbNumber

avgDb :: [DatabaseItem] -> Double
avgDb xs = sum / count
  where
    sum = fromIntegral . sumDb $ xs
    count = fromIntegral . length . filterDbNumber $ xs
