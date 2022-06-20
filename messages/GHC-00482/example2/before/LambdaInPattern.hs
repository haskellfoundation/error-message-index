module LambdaInPattern where

f :: (Int -> Int) -> Int
f (\a -> a) = 0
