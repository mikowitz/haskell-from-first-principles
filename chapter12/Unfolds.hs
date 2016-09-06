module Unfolds where

data BinaryTree a =
  Leaf
    | Node (BinaryTree a) a (BinaryTree a)
    deriving (Eq, Ord, Show)

myIterate :: (a -> a) -> a -> [a]
myIterate f s = s:myIterate f (f s)

myUnfoldr :: (b -> Maybe (a, b)) -> b -> [a]
myUnfoldr f s = a:myUnfoldr f b
  where
    Just (a, b) = f s

betterIterate :: (a -> a) -> a -> [a]
betterIterate f x = myUnfoldr (\a -> Just (a, f a)) x

unfold :: (Ord a, Ord b, Num b) => (a -> Maybe (a, b, a)) -> a -> BinaryTree b
unfold f x = case f x of
               Nothing -> Leaf
               Just (a, b, a') -> Node (unfold f a) b (unfold f a')

treeBuild :: Integer -> BinaryTree Integer
treeBuild n = unfold f 0
  where
    f m
      | m == n = Nothing
      | otherwise = Just (m+1, m, m+1)
