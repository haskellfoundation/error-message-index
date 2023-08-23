---
title: Linear function type was used in foreign function call
---

In this example the programmer tries to use a C function with the help of GHC's FFI system.
The type given to the imported function, however, is not allowed.
Only non-linear function types can be given to foreign functions.

```
messages/GHC-57396/linear-ffi/before/LinearFFI.hs:6:1: error: [GHC-57396]
    • Unacceptable argument type in foreign declaration:
        Linear types are not supported in FFI declarations, see #18472
    • When checking declaration:
        foreign import ccall safe "exp" c_exp :: Double %1 -> Double
  |
6 | foreign import ccall "exp" c_exp :: Double %1 -> Double
  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
```
