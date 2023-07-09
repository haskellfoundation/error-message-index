module Main where

import Data.Coerce (Coercible, coerce)
import Type.Reflection (Typeable(..))
import Data.Type.Equality

newtype Foo = Foo { unFoo :: () }

instance Coercible Foo ()

instance Typeable Foo

instance Foo ~ Foo

main :: IO ()
main = do
    let foo = Foo ()
    print (coerce foo:: ())
    print (typeOf foo)
    print (Refl :: Foo :~: Foo)
