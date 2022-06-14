{-# LANGUAGE TypeOperators #-}
module MissingArgument where

type a + b = Either a b

example :: String + Int
example = Right 5
