---
title: Type signature lacks an accompanying binding
---

If a type signature is given for a name in a local let expression, then the name also needs to be defined.

In this example, a type signature was given for the name `two` in a let expression, but no definition was specified.
This error can be fixed by adding a definition which accompanies the type signature.

## Error Message

```
MissingBinding.hs:6:5: error: [GHC-44432]
    The type signature for ‘two’ lacks an accompanying binding
  |
6 |     two :: Integer
  |     ^^^
```