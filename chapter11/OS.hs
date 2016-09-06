module OS where

data OperatingSystem = GnuPlusLinux
                     | OpenBSDPlusNevermindJustBSDStill
                     | Mac
                     | Windows
                     deriving (Eq, Show)

data ProgrammingLanguage = Haskell
                         | Agda
                         | Idris
                         | Ruby
                         deriving (Eq, Show)

data Programmer = Programmer { os :: OperatingSystem, lang :: ProgrammingLanguage }
  deriving (Eq, Show)


nineToFive :: Programmer
nineToFive = Programmer Mac Haskell

feelingWizardly :: Programmer
feelingWizardly = Programmer { lang = Agda, os = GnuPlusLinux }

allOperatingSystems :: [OperatingSystem]
allOperatingSystems =
  [ GnuPlusLinux
    , OpenBSDPlusNevermindJustBSDStill
    , Mac
    , Windows
  ]

allLanguages :: [ProgrammingLanguage]
allLanguages = [Haskell, Agda, Idris, Ruby]

allProgrammers :: [Programmer]
allProgrammers = [Programmer os lang | os <- allOperatingSystems, lang <- allLanguages]


