{-# LANGUAGE TypeApplications, RankNTypes, PolyKinds #-}

module TypeForTermArg where

lamApp = (\x -> x) @Int 12
