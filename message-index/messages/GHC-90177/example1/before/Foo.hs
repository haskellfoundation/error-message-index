module Foo where

data Foo = Foo

class IsAFoo x where
    convertToFoo :: x -> Foo