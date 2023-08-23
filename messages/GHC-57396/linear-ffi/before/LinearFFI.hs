{-# LANGUAGE LinearTypes #-}
module LinearFFI where

import Foreign.Ptr

foreign import ccall "exp" c_exp :: Double %1 -> Double
