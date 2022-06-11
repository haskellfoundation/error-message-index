{-# LANGUAGE Strict #-}

module StrictExtension where

data A = A
    { a :: Bool
    , b :: Int
    }

aFixed :: A
aFixed = A { a = True, b = 5 }

aAlsoFixed :: A
aAlsoFixed = A { a = True, b = 5 }
