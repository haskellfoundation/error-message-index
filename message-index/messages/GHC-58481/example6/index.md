---
title: Use of `capi` calling convention
---

In this example the user attempted to use `capi` calling convention for foreign imports without enabling the `CApiFFI` extension, which leads to this generic parsing error.

```
CAPI.hs:5:16: error: [GHC-58481]
    parse error on input ‘capi’
  |
5 | foreign import capi "setenv"
  |                ^^^^
```
