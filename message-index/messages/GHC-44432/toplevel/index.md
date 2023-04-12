---
title: Type signature lacks an accompanying binding
---

If a type signature is given for a name in a Haskell module, then the name also needs to be defined.

In this example, a type signature was given for the name `someBoolean` in a Haskell module, but no definition was specified.
This error can be fixed by adding a definition which accompanies the type signature.

## Error Message

```
MissingBinding.hs:3:1: error: [GHC-44432]
    The type signature for ‘someBoolean’ lacks an accompanying binding
  |
3 | someBoolean :: Bool
  | ^^^^^^^^^^^
```