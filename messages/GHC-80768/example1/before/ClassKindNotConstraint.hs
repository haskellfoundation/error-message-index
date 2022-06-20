{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE StandaloneKindSignatures #-}
{-# LANGUAGE TypeFamilies #-}

module ClassKindNotConstraint where

import Data.Kind

type family Id (x :: Type) :: Type where
  Id x = x

type C :: Type -> Id Constraint
class C a
