---
title: A local name is used in a top-level splice.
---

`x` and `foo` are both defined in the same module, causing the error.

# Error Message
```
Example.hs:10:6: error: [GHC-18157]
    • GHC stage restriction:
        ‘foo’ is used in a top-level splice, quasi-quote, or annotation,
        and must be imported, not defined locally
    • In the untyped splice: $foo
   |
10 | x = $foo
   |      ^^^
```
