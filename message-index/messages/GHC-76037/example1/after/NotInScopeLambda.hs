module NotInScopeLambda where

data Foo = A | B

f :: Foo -> Foo
f = \A -> A
