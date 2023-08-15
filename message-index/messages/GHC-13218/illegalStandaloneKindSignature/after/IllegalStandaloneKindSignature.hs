{-# LANGUAGE LinearTypes, KindSignatures, DataKinds #-}
module IllegalStandaloneKindSignature where

import GHC.Exts
import GHC.Types

type K = Type -> Type

data Void1 :: K
