{-# LANGUAGE MagicHash #-}

module IllegalUnboxedString where

import GHC.Prim
import GHC.Exts

g :: String -> Bool
g y = (y == "a")



