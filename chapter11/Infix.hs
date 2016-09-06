module Infix where

data Product a b = a :&: b
  deriving (Eq, Show)

data List a = Nil | Cons a (List a) deriving (Show)

data BinaryTree a =
  Leaf
    | Node (BinaryTree a) a (BinaryTree a)
    deriving (Eq, Ord, Show)

insert' :: Ord a => a -> BinaryTree a -> BinaryTree a
insert' x Leaf = Node Leaf x Leaf
insert' x (Node left y right)
  | x == y = Node left y right
  | x < y = Node (insert' x left) y right
  | x > y = Node left y (insert' x right)

