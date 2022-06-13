module Main2 where

import SomeDisplayLibrary (Display (..))

myFunction :: Bool -> Int
myFunction x =
  if x
    then 42
    else 54

myDisplayedAppliedFunction :: String
myDisplayedAppliedFunction = display (myFunction True)

newtype BoolFun a = BoolFun (Bool -> a)

instance Display a => Display (BoolFun a) where
  display (BoolFun f) =
    "(\\x -> if x then " <> display (f True) <>
    " else " <> display (f False) <> ")"

myDisplayedNewtypedFunction :: String
myDisplayedNewtypedFunction = display (BoolFun myFunction)
