module DivergingInstances where

instance Semigroup Int where
    (<>) = (+)

instance Semigroup Int where
    (<>) = (*)