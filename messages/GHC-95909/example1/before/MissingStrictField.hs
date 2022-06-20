module MissingStrictField where

data A = A
    { a :: !Bool
    , b :: Int
    }

aFine :: A
aFine = A { a = True }

aBad :: A
aBad = A { b = 5 }
