{-# LANGUAGE MagicHash #-}

module IllegalUnboxedString where

import GHC.Prim
import GHC.Exts

g :: Addr# -> Bool
g y = isTrue# (y `eqAddr#` ("a"#))



