module Main where

data A = A
data B = B

f :: A -> B
f A = B

g = f A
