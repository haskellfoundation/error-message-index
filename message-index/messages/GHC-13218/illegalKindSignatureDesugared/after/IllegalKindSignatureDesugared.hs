{-# LANGUAGE LinearTypes, KindSignatures, DataKinds #-}
module IllegalKindSignatureDesugared where

import GHC.Exts
import GHC.Types

data Void1 :: FUN Many Type Type
