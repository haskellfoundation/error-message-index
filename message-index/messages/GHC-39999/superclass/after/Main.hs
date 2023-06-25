import Data.Functor.Classes (Show1(..))

newtype Foo a = Foo a

instance Show a => Show (Foo a) where
   show (Foo a) = "Foo " ++ show a

instance Show1 Foo where
  liftShowsPrec showsPrec _showList prec (Foo a) rest = "Foo " ++ showsPrec prec a rest
