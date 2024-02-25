{-# LANGUAGE NoFieldSelectors #-}

module A (Foo (..)) where

data Foo = MkFoo { fint :: Int, fchar :: Char }
