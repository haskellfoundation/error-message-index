data Foo = A | B deriving Eq

isA :: Foo -> Bool
isA foo = foo == A
