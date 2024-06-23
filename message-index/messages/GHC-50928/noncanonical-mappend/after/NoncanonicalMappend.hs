module NoncanonicalMappend where

data A = A

instance Semigroup A where
  A <> A = A

instance Monoid A where
  mempty = A
  mappend = (<>)

