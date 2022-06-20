module Main1 where

import SomeEncodingLibrary (Encoded, encode)

myValue :: Integer
myValue = 42

myEncodedValue :: Encoded
myEncodedValue = encode myValue
