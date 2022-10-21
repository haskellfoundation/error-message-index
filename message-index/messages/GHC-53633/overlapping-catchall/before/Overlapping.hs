module Overlapping where

f [] = True
f (_:_:xs) = f xs
f [_] = False
f _ = False
