module Example3 where

import A (Foo (MkFoo, fint, fchar))

getFooInt :: Foo -> Int
getFooInt (MkFoo i _) = i -- this is fine

-- Creation and updates below are fine

mkFoo :: Foo
mkFoo =
  MkFoo
    { fint = 0,
      fchar = 'a'
    }

setFooInt :: Foo -> Int -> Foo
setFooInt f x = f { fint = x }
