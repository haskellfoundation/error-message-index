{-# LANGUAGE Strict #-}

module StrictExtension where

data A = A
    { a :: Bool
    , b :: Int
    }

aBad :: A
aBad = A { a = True }

aAlsoBad :: A
aAlsoBad = A { b = 5 }
