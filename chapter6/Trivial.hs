module Trivial where

data Trivial = Trivial

data DayOfWeek =
  Mon | Tue | Wed | Thu | Fri | Sat | Sun

data Date = Date DayOfWeek Int

instance Eq Trivial where
  Trivial == Trivial = True

instance Eq DayOfWeek where
  (==) Mon Mon = True
  (==) Tue Tue = True
  (==) Wed Wed = True
  (==) Thu Thu = True
  (==) Fri Fri = True
  (==) Sat Sat = True
  (==) Sun Sun = True
  (==) _   _   = False

instance Eq Date where
  (==) (Date weekday dayOfMonth) (Date weekday' dayOfMonth') =
    weekday == weekday' && dayOfMonth == dayOfMonth'
