{-# LANGUAGE TypeOperators #-}
module MissingArgument where

type a + b = Either a b

example :: + Int
example = Right 5
