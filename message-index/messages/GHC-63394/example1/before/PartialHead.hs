module PartialHead where

example :: Int
example =
  let list = 1 : 2 : 3 : [] in
  head list
