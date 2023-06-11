---
title: Bang (!) on unlifted type
---

```
src/MyLib.hs:16:5: warning: [GHC-55666] [-Wredundant-strictness-flags]
    * Strictness flag has no effect on unlifted type `Int#'
    * In the definition of data constructor `MkT'
      In the data type declaration for `T'
   |
   |   = MkT !Int#
   |     ^^^^^^^
```
