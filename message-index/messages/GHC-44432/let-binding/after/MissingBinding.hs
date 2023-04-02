module MissingBinding where

fortytwo :: Integer
fortytwo =
  let
    two :: Integer
    two = 2
  in 
    40 + two