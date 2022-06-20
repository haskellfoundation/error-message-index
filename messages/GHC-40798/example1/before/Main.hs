{-# OPTIONS -Woperator-whitespace #-}

module Main where

main :: IO ()
main = print "notice the usage of whitespace below"

f :: Num a => a -> a -> a
f a b = a+ b -- this one is a warning

g :: Num a => a -> a -> a
g a b = a +b -- this one is also a warning

h :: Num a => a -> a -> a
h a b = a+b -- this one as well
