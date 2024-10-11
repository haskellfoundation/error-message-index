module StrictField where

data Foo = MkFoo !Int Int

foo :: Foo -> Foo -> ()
foo !a (MkFoo !b !c) = ()
