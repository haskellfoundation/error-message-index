module DsIncompleteRecSel where

data T = T1 | T2 {x :: Bool}

f :: T -> Bool
f a = x a
