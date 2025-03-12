{-# LANGUAGE RequiredTypeArguments #-}

module WrongUsage where

import Data.Kind (Type)

data Set (cxt :: id -> Type) a = Set [a]
