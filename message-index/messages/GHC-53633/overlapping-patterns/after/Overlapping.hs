module Overlapping where

f :: Maybe a -> Bool
f (Just _) = True
f _ = False
