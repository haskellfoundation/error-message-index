module Main1 where

import SomeEncodingLibrary (Encoded, encode)

myValue :: Int
myValue = 42

myEncodedValue :: Encoded
myEncodedValue = encode myValue
