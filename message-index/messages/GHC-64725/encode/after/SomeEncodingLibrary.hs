{-# LANGUAGE DataKinds #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE TypeFamilies #-}

module SomeEncodingLibrary where

import GHC.TypeLits

class Encode a

data Encoded = Encoded

encode :: Encode a => a -> Encoded
encode _ = Encoded

instance Encode ()

instance Encode Bool

instance Encode Int

instance Encode Word

instance (Encode a, Encode b) => Encode (a, b)

instance TypeError (Text "Cannot encode arbitrary precision integers." :$$:
                    Text "Consider using a fixed size representation.")
    => Encode Integer
