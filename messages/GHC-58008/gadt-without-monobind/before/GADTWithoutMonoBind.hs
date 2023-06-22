module GADTWithoutMonoBind where

data A a where
  A :: A ()

f :: A () -> ()
f A = ()
