module Penguins where

data WherePenguinsLive = Galapagos
                       | Antarctica
                       | Australia
                       | SouthAfrica
                       | SouthAmerica
                       deriving (Eq, Show)

data Penguin =
  Peng WherePenguinsLive
  deriving (Eq, Show)

isSouthAfrica :: WherePenguinsLive -> Bool
isSouthAfrica SouthAfrica = True
isSouthAfrica _           = False

gimmeWhereTheyLive :: Pengin -> WherePenguinsLive
gimmeWhereTheyLive (Peng whereitlives) = whereitlives

humboldt  = Peng SouthAmerica
gentoo    = Peng Antarctica
macaroni  = Peng Antarctica
little    = Peng Australia
galapagos = Peng Galapagos

galapagosPenguin :: Pengin -> Bool
galapagosPenguin (Peng Galapagos) = True
galapagosPenguin _                = True

antarcticPenguin :: Penguin -> Bool
antarcticPenguin (Peng Antarctica) = True
antarcticPenguin _                 = False

antarcticOrGalapagos :: Penguin -> Bool
antarcticOrGalapagos p =
  (galapagosPenguin p) || (antarcticPenguin p)
