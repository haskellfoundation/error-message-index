module Main2 where

import SomeDisplayLibrary (Display (..))

myFunction :: Bool -> Int
myFunction x =
  if x
    then 42
    else 54

myDisplayedFunction :: String
myDisplayedFunction = display myFunction
