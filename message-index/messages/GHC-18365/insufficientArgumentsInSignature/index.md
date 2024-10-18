---
title: Insufficient arguments in type signature
---

## Error Message

```
InsufficientArgumentsInSignature:6:1: error: [GHC-18365]
    • Pattern synonym ‘P’ has two arguments
        but its type signature has 1 fewer arrows
    • In the declaration for pattern synonym ‘P’
  |
6 | pattern P a b = (a, b)
  | ^^^^^^^^^^^^^^^^^^^^^^
```

## Explanation

In this case, the equation in the definition specified two arguments, but the
signature specified only one.
