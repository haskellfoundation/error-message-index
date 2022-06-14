---
title: Kind and type variables out of dependency order
---

## Message
```
DependencyOrder.hs:8:15: error: [GHC-97739]
    • These kind and type variables: a k (b :: k)
      are out of dependency order. Perhaps try this ordering:
        k (a :: k) (b :: k)
    • In the type signature: foo :: forall a k (b :: k). SameKind a b
  |
8 | foo :: forall a k (b :: k). SameKind a b
  |               ^^^^^^^^^^^^
```

## Explanation

The type `SameKind a b` forces types `a` and `b` to have the same kind, because the kind variable `k` is used for both in its declaration. Thus, `a`'s kind is forced to be `k`, based on `b`'s kind annotation. However, this would result in `a`'s kind not being in scope when `a` is declared. The error can be fixed by reversing the arguments `a` and `k` so that `a` is in `k`'s scope.
