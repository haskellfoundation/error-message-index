---
title: Empty parameter list in lambda
---

The parameter list of a lambda expression must contain at least one parameter, but here it is empty.

## Error Message

```
LambdaNoParams.hs:3:7: error: [GHC-71614]
    A lambda requires at least one parameter
  |
3 | lam = \ -> 0
  |       ^^^^^^
```
