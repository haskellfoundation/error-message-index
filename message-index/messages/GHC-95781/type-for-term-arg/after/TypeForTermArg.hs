{-# LANGUAGE TypeApplications, RankNTypes, PolyKinds #-}

module TypeForTermArg where

lamApp1 = (\x -> x) 12
lamApp2 = ((\x -> x) :: forall a. a -> a) @Int 12
