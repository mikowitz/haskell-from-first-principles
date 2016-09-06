module EitherFuncs where

addIfLeft :: Either a b -> [a] -> [a]
addIfLeft (Left a) acc = a:acc
addIfLeft _ acc = acc

addIfRight :: Either a b -> [b] -> [b]
addIfRight (Right b) acc = b:acc
addIfRight _ acc = acc

lefts' :: [Either a b] -> [a]
lefts' = foldr addIfLeft []

rights' :: [Either a b] -> [b]
rights' = foldr addIfRight []

partitionEithers' :: [Either a b] -> ([a], [b])
partitionEithers' xs = (lefts' xs, rights' xs)

eitherMaybe' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe' _ (Left _) = Nothing
eitherMaybe' f (Right b) = Just $ f b

either' :: (a -> c) -> (b -> c) -> Either a b -> c
either' fac _ (Left a) = fac a
either' _ fbc (Right b) = fbc b

eitherMaybe'' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe'' f e = either' (\x -> Nothing) (Just . f) e
