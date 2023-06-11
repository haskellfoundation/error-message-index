{-# LANGUAGE Haskell2010 #-}
module IllegalSynonymInstance where

data RGB = R | G | B

instance Eq RGB where
    R == R = True
    G == G = True
    B == B = True
    _ == _ = False
