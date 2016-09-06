module Quantum where

data Quantum =
  Yes
    | No
    | Both
    deriving (Eq, Show)

-- 3 + 3
quantSum1 :: Either Quantum Quantum
quantSum1 = Right Yes

quantSum2 :: Either Quantum Quantum
quantSum2 = Right No

quantSum3 :: Either Quantum Quantum
quantSum3 = Right Both

quantSum4 :: Either Quantum Quantum
quantSum4 = Left Yes

quantSum5 :: Either Quantum Quantum
quantSum5 = Left No

quantSum6 :: Either Quantum Quantum
quantSum6 = Left Both

-- 3 * 3
quantProd :: (Quantum, Quantum)
quantProd = (Yes, Yes)

-- 3 ^ 3
quantFlip1 :: Quantum -> Quantum
quantFlip1 Yes  = Yes
quantFlip1 No   = Yes
quantFlip1 Both = Yes

convert :: Quantum -> Bool
convert Yes = True
convert No = True
convert Both = True

convert :: Quantum -> Bool
convert Yes = True
convert No = True
convert Both = False

convert :: Quantum -> Bool
convert Yes = False
convert No = True
convert Both = True

convert :: Quantum -> Bool
convert Yes = False
convert No = True
convert Both = False

convert :: Quantum -> Bool
convert Yes = False
convert No = False
convert Both = True

convert :: Quantum -> Bool
convert Yes = False
convert No = False
convert Both = False
