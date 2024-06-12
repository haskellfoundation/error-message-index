{-# LANGUAGE Haskell2010 #-}
module Example1 where

data A = A | B
instance Eq A where
    (==) :: A -> A -> Bool
    A == A = True
    B == B = True
    _ == _ = False
