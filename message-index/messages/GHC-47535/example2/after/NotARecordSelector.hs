module NotARecordSelector where

class Foo a where
  foo :: a -> ()

data Bar = Bar { bar :: () }

test :: Bar
test = undefined { bar = () }
