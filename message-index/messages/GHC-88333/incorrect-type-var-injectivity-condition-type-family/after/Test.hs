{-# LANGUAGE PolyKinds #-}
{-# LANGUAGE TypeFamilyDependencies #-}

module IncorrectTypeVarLHSInjectivityCondition where

type family F a = r | r -> a