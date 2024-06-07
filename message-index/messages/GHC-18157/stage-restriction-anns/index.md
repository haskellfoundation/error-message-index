---
title: A local name is used in an annotation.
---

`foo` and `bar` are both defined in the same module, causing the error.

# Error Message
```
Example.hs:3:13: error: [GHC-18157]
    • GHC stage restriction:
        ‘bar’ is used in a top-level splice, quasi-quote, or annotation,
        and must be imported, not defined locally
    • In the annotation: {-# ANN foo bar #-}
  |
3 | {-# ANN foo bar #-}
  |             ^^^
```
