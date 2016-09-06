module TheQuad where

data Quad =
  One
    | Two
    | Three
    | Four
    deriving (Eq, Show)

-- 4 + 4 = 8
eQuad :: Either Quad Quad
eQuad = Right One

-- 4 * 4 = 16
prodQuad :: (Quad, Quad)
prodQuad = undefined

-- 4 ^ 4 = 256
funcQuad :: Quad -> Quad
funcQuad = undefined

-- 2 * 2 * 2 = 8
tripletBool :: (Bool, Bool, Bool)
tripletBool = undefined

-- 2 ^ (2 * 2) = 256
funcTripBool :: Bool -> Bool -> Bool
funcTripBool = undefined

-- 4 ^ (4 * 2) =  65536
funcBoolTwoQuad :: Bool -> Quad -> Quad
funcBoolTwoQuad = undefined
