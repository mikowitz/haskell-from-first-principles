module Phone where

import Data.Char (isUpper, toLower)

type Digit = Char
type Presses = Int

data DaPhone = DaPhone Digit [Char]

one = DaPhone '1' "1"
two = DaPhone '2' "abc2"
three = DaPhone '3' "def3"
four = DaPhone '4' "ghi4"
five = DaPhone '5' "jkl5"
six = DaPhone '6' "mno6"
seven = DaPhone '7' "pqrs7"
eight = DaPhone '8' "tuv8"
nine = DaPhone '9' "wxyz9"

{-reverseTaps :: DaPhone -> Char -> [(Digit, Presses)]-}
{-reverseTaps p c-}
  {-| isUpper c == ('*', 1):reverseTaps p (toLower c)-}
  {-| otherwise = [k-}
