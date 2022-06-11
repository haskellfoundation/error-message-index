{-# OPTIONS_GHC -Wincomplete-patterns #-}

safeHead :: [a] -> Maybe a
safeHead (x : xs) = Just x
safeHead [] = Nothing
