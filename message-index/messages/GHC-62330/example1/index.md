---
title: Underscore not allowed in float literal
---

Float literals may not contain underscores if the `NoNumericUnderscores` language extension is enabled.
Here, the float literal `1_000.0_1` contains underscores, but the extension is enabled.
The error can be fixed by removing the underscores or disabling the extension.

## Error Message
```
UnderscoreInFloatLiteral.hs:6:3: error: [GHC-62330]
    Illegal underscores in floating literals
    Suggested fix: Perhaps you intended to use NumericUnderscores
  |
6 | f 1_000.0_1 = ()
  |   ^^^^^^^^^
```
