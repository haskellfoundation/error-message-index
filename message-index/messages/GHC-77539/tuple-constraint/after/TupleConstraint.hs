{-# LANGUAGE ConstraintKinds #-}
module TupleConstraint where

addFromString :: ((Read a, Show a), Num a) => String -> a -> String
addFromString x y = show (read x + y)
