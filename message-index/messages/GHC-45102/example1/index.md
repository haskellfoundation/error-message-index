---
title: Lambda syntax in `case` expression
---

When pattern matching with a `case` expression, backslash (`\`) is not required before the pattern.

## Error Message

```haskell
LambdaInCase.hs:6:5: error: [GHC-00482]
    Lambda-syntax in pattern.
    Pattern matching on functions is not possible.
  |
6 |     \a -> a
  |     ^^^^^^^
```
