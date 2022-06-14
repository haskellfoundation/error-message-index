{-# OPTIONS -Woperator-whitespace #-}

module Main where

main :: IO ()
main = print "notice the usage of whitespace below"

f :: Num a => a -> a -> a
f a b = a + b
