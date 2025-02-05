module DsIncompleteRecSel where

data T = T1 | T2 {x :: Bool}

f T1 = True -- handle the T1 case
f a = x a
