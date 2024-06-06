{-# LANGUAGE RequiredTypeArguments #-}

module ProperUsage where

import Data.Kind (Type)

data Set (cxt :: forall id. id -> Type) a = Set [a]
