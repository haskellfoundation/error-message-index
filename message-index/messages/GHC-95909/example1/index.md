---
title: Missing strict field in record syntax
---

The instantiation of a strict field in a record is missing. In `aFine`, we can leave one field uninstantiated as it is not strict, and therefore is not evaluated until needed, due to lazy evaluation. However in `aBad` we cannot, as the field `a` is strict.

## Error Message

```
MissingStrictField.hs:12:8: error: [GHC-95909]
    • Constructor ‘A’ does not have the required strict field(s): a
    • In the expression: A {b = 5}
      In an equation for ‘aBad’: aBad = A {b = 5}
   |
12 | aBad = A { b = 5 }
   |        ^^^^^^^^^^^
```
