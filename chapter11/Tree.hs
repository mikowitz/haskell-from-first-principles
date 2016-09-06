module Tree where

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

mapTree :: (a -> b) -> BinaryTree a -> BinaryTree b
mapTree _ Leaf = Leaf
mapTree f (Node left a right) =
  Node (mapTree f left) (f a) (mapTree f right)

testTree' :: BinaryTree Integer
testTree' = Node (Node Leaf 3 Leaf) 1 (Node Leaf 4 Leaf)

mapExpected = Node (Node Leaf 4 Leaf) 2 (Node Leaf 5 Leaf)

mapOkay =
  if mapTree (+1) testTree' == mapExpected
     then print "yep!"
     else error "nope!"

preorder :: BinaryTree a -> [a]
preorder Leaf = []
preorder (Node left a right) = [a] ++ preorder left ++ preorder right

inorder :: BinaryTree a -> [a]
inorder Leaf = []
inorder (Node left a right) = inorder left ++ [a] ++ inorder right

postorder :: BinaryTree a -> [a]
postorder Leaf = []
postorder (Node left a right) = postorder left ++ postorder right ++ [a]

foldTree :: (a -> b -> b) -> b -> BinaryTree a -> b
foldTree _ acc Leaf = acc
foldTree f acc tree = foldr f acc (preorder tree)

testTree :: BinaryTree Integer
testTree = Node (Node Leaf 1 Leaf) 2 (Node Leaf 3 Leaf)

testPreorder :: IO ()
testPreorder = if preorder testTree == [2, 1, 3] then putStrLn "Preorder fine!" else putStrLn "Bad news bears."

testInorder :: IO ()
testInorder = if inorder testTree == [1, 2, 3] then putStrLn "Inorder fine!" else putStrLn "Bad news bears."

testPostorder :: IO ()
testPostorder = if postorder testTree == [1, 3, 2] then putStrLn "Postorder fine!" else putStrLn "postorder failed check"

testFold :: IO ()
testFold = if foldTree (+) 0 testTree == 6 then putStrLn "Fold fine!" else putStrLn "bad news bears..."

main :: IO ()
main = do
  testPreorder
  testInorder
  testPostorder
  testFold
