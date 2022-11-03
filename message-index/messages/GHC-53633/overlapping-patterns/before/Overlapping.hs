module Overlapping where

f :: Maybe a -> Bool
f (Just _) = True
f (Just _) = False
f _ = False

