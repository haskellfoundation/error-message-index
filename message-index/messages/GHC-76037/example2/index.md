---
title: Unbound class name
---

The class name `B` referenced in the definition of class `C` is not in scope.

## Error Message

```
NotInScopeClass.hs:3:8: error: [GHC-76037]
    Not in scope: type constructor or class ‘B’
  |
3 | class (B a) => C a where
  |        ^
```
