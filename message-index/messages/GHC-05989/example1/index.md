---
title: Mismatched data declaration
---

## Error Message

```
Main.hs:5:1: error: [GHC-05989]
    • Not a function kind: *
      but extra binders found: y
    • In the data type declaration for ‘A’
  |
5 | data A x y
  | ^^^^^^^^^^
```

## Explanation

This example declares `A` to have kind `* -> *`, meaning it is a type
constructor that takes one argument. However, the `data` declaration for `A` has
two arguments (`x` and `y`), so it does not match the kind signature.

This can be fixed by either updating the `data` declaration to match the kind
signature (by removing the argument `y`) or updating the kind signature to match
the `data` declaration (by adding an argument of kind `*`).
