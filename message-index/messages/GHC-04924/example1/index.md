---
title: Unknown flag in  {-\# OPTIONS_GHC \#-} pragma
---

A flag was found in the `OPTIONS_GHC` pragma that was not known.

## Error Message
```
UnknownOptionsFlag.hs:1:16: error: [GHC-04924]
    unknown flag in  {-# OPTIONS_GHC #-} pragma: -flat-specialise
  |
1 | {-# OPTIONS_GHC -flat-specialise #-}
  |                ^^^^^^^^^^^^^^^^^^
```
