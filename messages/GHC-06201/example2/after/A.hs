module A where

data Box t = SomeBox t

instance Functor Box where
    fmap f (SomeBox a) = SomeBox (f a)

instance Applicative Box where
    pure a = SomeBox a
    SomeBox f <*> SomeBox a = SomeBox (f a)
