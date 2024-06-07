---
title: A local name is used in a quasi-quote.
---

`foo` and `qq` are both defined in the same module, causing the error.

# Error Message
```
Example.hs:16:7: error: [GHC-18157]
    • GHC stage restriction:
        ‘qq’ is used in a top-level splice, quasi-quote, or annotation,
        and must be imported, not defined locally
    • In the quasi-quotation: [qq|bar|]
   |
16 | foo = [qq|bar|]
   |       ^^^^^^^^^
```
