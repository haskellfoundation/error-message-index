module MissingSpaceBangPattern where

(!) :: Int -> Int -> Bool
(!) a b = a == b

infixl 5 !

f :: Int -> Bool
f x = x ! 1
