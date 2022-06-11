{-# OPTIONS_GHC -Wincomplete-patterns #-}

mySum :: [Int] -> Int
mySum (x : xs) = x + mySum xs
mySum [] = 0
