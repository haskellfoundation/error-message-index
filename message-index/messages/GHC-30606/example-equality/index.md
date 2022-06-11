---
title: Redundant equality constraints
---

## Error Message

```
Example.hs:5:6: warning: [-Wredundant-constraints] [GHC-30606]
    Redundant constraint: b ~ a
    In the type signature for:
         f :: forall a b. (a ~ b, b ~ a) => a -> b
  |
5 | f :: (a ~ b, b ~ a) => a -> b
  |      ^^^^^^^^^^^^^^
```

## Explanation

This example declares `f` with the constraints `(a ~ b, b ~ a)` (`a` is
equal to `b` and `b` is equal to `a`), but `a ~ b` already implies
that `b ~ a` (in other words, `~` is a [symmetric relation]).

We fix this by removing the constraint which is marked as redundant in the error
message, namely `b ~ a`.

[symmetric relation]: https://en.wikipedia.org/wiki/Symmetric_relation
