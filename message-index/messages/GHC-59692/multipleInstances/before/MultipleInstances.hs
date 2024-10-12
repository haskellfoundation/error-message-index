module MultipleInstances where

instance Semigroup Int where
    (<>) = (+)

instance Semigroup Int where
    (<>) = (*)