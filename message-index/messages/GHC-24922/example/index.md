---
title: Cannot reify type because name is not in scope
---

GHC fails with an error because the requested name is not in scope.

## Error Message

```haskell
CannotReifyOutOfScopeThing.hs:7:1: error: [GHC-24922]
    ‘doesn'tExist’ is not in scope at a reify
  |
7 | do  t <- reifyType (mkName "doesn'tExist")
  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^...
```
