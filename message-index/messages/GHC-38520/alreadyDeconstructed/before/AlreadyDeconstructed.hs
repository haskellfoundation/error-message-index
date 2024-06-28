module AlreadyDeconstructed where

doubleIfTrue :: (Int, Bool) -> Int
doubleIfTrue (x, y) | y = x * 2
doubleIfTrue !x         = fst x
