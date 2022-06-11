{-# LANGUAGE BangPatterns #-}

module StringBangPatterns where

data A = A
    { a :: !Bool
    , b :: Int
    }

aFine :: A
aFine = A { a = True }

aFixed :: A
aFixed = A { a = True, b = 5 }
