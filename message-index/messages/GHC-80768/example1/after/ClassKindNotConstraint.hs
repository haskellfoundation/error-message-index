{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE StandaloneKindSignatures #-}

module ClassKindNotConstraint where

import Data.Kind

type C :: Type -> Constraint
class C a
