{-# LANGUAGE DataKinds #-}
{-# LANGUAGE UndecidableInstances #-}

module SomeDisplayLibrary where

import GHC.TypeLits

class Display a where
  display :: a -> String

instance Display () where
  display () = "()"

instance Display Bool where
  display b = if b then "True" else "False"

instance Display Int where
  display = show

instance (Display a, Display b) => Display (a, b) where
  display (a, b) = "(" <> display a <> ", " <> display b <> ")"

instance TypeError (Text "Cannot display functions." :$$:
                    Text "Perhaps there are missing arguments?")
    => Display (a -> b) where
  display = error "unreachable: instance Display (a -> b)"
