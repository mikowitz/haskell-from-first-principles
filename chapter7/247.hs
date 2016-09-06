module Page247 where

m x y z = x * y * z

m' x y = \z -> x * y * z

m'' x = \y -> \z -> x * y * z

m''' = \x -> \y -> \z -> x * y * z
