{-# LANGUAGE Haskell2010 #-}
module IllegalSynonymInstance where

data RGB = R | G | B

type T = RGB

instance Eq T where
    R == R = True
    G == G = True
    B == B = True
    _ == _ = False
