module CAPI where

import Foreign.C

foreign import capi "setenv"
  c_setenv :: CString -> CString -> CInt -> IO CInt
