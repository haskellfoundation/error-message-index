module Main where

import Data.Coerce
import Data.Type.Equality
import Type.Reflection

newtype Foo = Foo { unFoo :: () }

main :: IO ()
main = do
    let foo = Foo ()
    print (coerce foo:: ())
    print (typeOf foo)
    print (Refl :: Foo :~: Foo)
