---
title: Underscore not allowed in integer literal
---

Integer literals may not contain underscores if the `NoNumericUnderscores` language extension is enabled.
Here, the integer literal `1_000` contains underscores, but the extension is enabled.
The error can be fixed by removing the underscores or disabling the extension.

## Error Message
```
UnderscoreInIntegerLiteral.hs:6:3: error: [GHC-62330]
    Illegal underscores in integer literals
    Suggested fix: Perhaps you intended to use NumericUnderscores
  |
6 | f 1_000 = ()
  |   ^^^^^
```
