{-# LANGUAGE PolyKinds #-}
{-# LANGUAGE TypeFamilyDependencies #-}

module IncorrectTypeVarLHSInjectivityCondition where

type family F a = r | r -> a

-- Given input type a, there is exactly one output type r that the type family can map to
-- So, the uncommenting the lines below would be incorrect because it violates the injectivity condition
-- since the type family F would map both Char and Int to Double
-- type instance F Char = Double
-- type instance F Int = Double