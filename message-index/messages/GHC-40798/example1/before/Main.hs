{-# OPTIONS -Woperator-whitespace #-}

module Main where

main = print "notice the usage of whitespace below"

f a b = a+ b -- this one is a warning

g a b = a +b -- this one is also a warning

h a b = a+b -- this one as well
