{-# LANGUAGE MagicHash #-}

module IllegalUnboxedString where

import GHC.Prim

g :: Addr# -> Bool
g y = case y of
    "a"# -> True
    _    -> False