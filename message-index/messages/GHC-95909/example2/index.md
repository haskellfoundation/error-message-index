---
title: All fields are strict without explicit bang patterns if the language extension is enabled
---

When using the language extension `{-# LANGUAGE Strict #-}` or `{-# LANGUAGE StrictData #-}`, all fields are strict, even if we do not explicitly use the strictness bang pattern `!`. Thus, we must instantiate all fields on construction.

## Error Message

```
Main.hs:9:8: error:  [GHC-95909]
    • Constructor ‘A’ does not have the required strict field(s): b
    • In the expression: A {a = True}
      In an equation for ‘aBad’: aBad = A {a = True}
  |
9 | aBad = A { a = True }
  |        ^^^^^^^^^^^^^^

Main.hs:12:12: error: [GHC-95909]
    • Constructor ‘A’ does not have the required strict field(s): a
    • In the expression: A {b = 5}
      In an equation for ‘aAlsoBad’: aAlsoBad = A {b = 5}
   |
12 | aAlsoBad = A { b = 5 }
   |            ^^^^^^^^^^^
```
