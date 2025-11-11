module Shortfish where

data P a = P

instance Functor P where
  fmap _ _ = P

instance Applicative P where
  pure _ = P
  _ <*> _ = P

instance Monad P where
  _ >>= _ = P
