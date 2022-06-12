---
title: Unbound data constructor in lambda
---

The data constructor `A` used in the lambda expression is not in scope.

## Error Message

```
NotInScopeLambda.hs:3:6: error: [GHC-76037]
    Not in scope: data constructor ‘A’
  |
3 | f = \A -> A
  |      ^
```
