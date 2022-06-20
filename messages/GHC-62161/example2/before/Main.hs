{-# OPTIONS_GHC -Wincomplete-patterns #-}

safeHead :: [a] -> a
safeHead (x : xs) = x
