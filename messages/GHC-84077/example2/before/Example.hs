{-# LANGUAGE TypeApplications #-}
module Example where

g :: (Num a) => a -> a
g x = x * 2

f = g@Int