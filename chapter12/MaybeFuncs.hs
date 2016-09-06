module MaybeFuncs where

isJust :: Maybe a -> Bool
isJust (Just _) = True
isJust Nothing = False

isNothing :: Maybe a -> Bool
isNothing = not . isJust

mayybee :: b -> (a -> b) -> Maybe a -> b
mayybee x _ Nothing = x
mayybee x f (Just a) = f a

fromMaybe :: a -> Maybe a -> a
fromMaybe x Nothing = x
fromMaybe _ (Just a) = a

listToMaybe :: [a] -> Maybe a
listToMaybe [] = Nothing
listToMaybe (x:_) = Just x

maybeToList :: Maybe a -> [a]
maybeToList Nothing = []
maybeToList (Just a ) = [a]

catMaybes :: [Maybe a] -> [a]
catMaybes [] = []
catMaybes (Nothing:xs) = catMaybes xs
catMaybes ((Just x):xs) = x:catMaybes xs

flipMaybe :: [Maybe a] -> Maybe [a]
flipMaybe xs
  | length xs == length (catMaybes xs) = Just $ catMaybes xs
  | otherwise = Nothing
{-flipMaybe (Nothing:_) = Nothing-}
{-flipMaybe xs = Just $ catMaybes xs-}

main :: IO ()
main = do
  print (isJust (Just 1))
  print (not $ isJust Nothing)
  print (not $ isNothing (Just 1))
  print (isNothing Nothing)
  print (mayybee 0 (+1) Nothing == 0)
  print (mayybee 0 (+1) (Just 1) == 2)
  print (fromMaybe 0 Nothing == 0)
  print (fromMaybe 0 (Just 1) == 1)
