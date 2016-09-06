module PityTheBool where

import Data.Int

data BigSmall =
  Big Bool
    | Small Bool
    deriving (Eq, Show)

data NumberOrBool =
  Numba Int8
    | BoolyBool Bool
    deriving (Eq, Show)

data QuantumBool = QuantumTrue
                 | QuantumFalse
                 | QuantumBoth
                 deriving (Eq, Show)

data TwoQs =
  MkTwoQs QuantumBool QuantumBool
  deriving (Eq, Show)
