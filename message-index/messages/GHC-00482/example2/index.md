---
title: Lambda syntax in pattern match
---

Pattern matching on functions is not possible.

## Error Message

```haskell
LambdaInPattern.hs:4:4: error: [GHC-00482]
    Lambda-syntax in pattern.
    Pattern matching on functions is not possible.
  |
4 | f (\a -> a) = 0
  |    ^^^^^^^
```
