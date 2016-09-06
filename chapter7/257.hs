module Page257 where

k :: (a, b) -> a
k (x, y) = x

k1 :: Num a => a
k1 = k ((4-1), 10)

k2 :: String
k2 = k ("three", (1+2))

k3 :: Num a => a
k3 = k (3, True)

f :: (a, b, c) -> (d, e, f) -> ((a, d), (c, f))
f (x, y, z) (x', y', z') = ((x, x'), (z, z'))
