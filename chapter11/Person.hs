module Person where

{-data Person = MkPerson String Int deriving (Eq, Show)-}

{-mb = MkPerson "Michael" 31-}
{-lh = MkPerson "Lauren" 38-}

{-name :: Person -> String-}
{-name (MkPerson x _) = x-}

data Person = Person { name :: String , age :: Int } deriving (Eq, Show)
