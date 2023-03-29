---
title: Type signature lacks an accompanying binding
---

If a toplevel type signature is given, then there also needs to be an accompanying binding.

In this example, a type signature was specified for `someBoolean`, but no binding was given.
This error can be fixed by adding a binding which accompanies the type signature.

## Error Message

```
MissingBinding.hs:3:1: error: [GHC-44432]
    The type signature for ‘someBoolean’ lacks an accompanying binding
  |
3 | someBoolean :: Bool
  | ^^^^^^^^^^^
```