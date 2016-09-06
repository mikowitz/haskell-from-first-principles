module Jammin where

import Data.List

data Fruit =
  Peach
    | Plum
    | Apple
    | Blackberry
    deriving (Eq, Ord, Show)

{-data JamJars =-}
  {-Jam Fruit Int-}
  {-deriving (Eq, Show)-}

data JamJars = Jam { fruit :: Fruit, jars :: Int } deriving (Eq, Show)

shelf1 = Jam Peach 12
shelf2 = Jam Plum 3
shelf3 = Jam Apple 11
shelf4 = Jam Blackberry 6
shelf5 = Jam Plum 4
shelf6 = Jam Apple 4
allTheJam = [shelf1, shelf2, shelf3, shelf4, shelf5, shelf6]

mostRow :: JamJars
mostRow = foldr (\j j' -> if (jars j) > (jars j') then j else j') (Jam Apple 0) allTheJam

compareKind :: JamJars -> JamJars -> Ordering
compareKind (Jam k _) (Jam k' _) = compare k k'

sortOnKind :: JamJars -> JamJars -> Bool
sortOnKind j j' = if (compareKind j j') == EQ then True else False

groupJam :: [[JamJars]]
groupJam = groupBy sortOnKind allTheJam

