---
title: Redundant typeclass constraints
---

## Error Message

```
Example.hs:5:6: warning: [-Wredundant-constraints] [GHC-30606]
    Redundant constraint: Eq a
    In the type signature for:
         f :: forall a. (Eq a, Ord a) => a -> a -> Bool
  |
5 | f :: (Eq a, Ord a) => a -> a -> Bool
  |      ^^^^^^^^^^^^^
```

## Explanation

This example declares `f` with the constraints `(Eq a, Ord a)`, but an `Ord a`
instance already implies an `Eq a` instance, because `Eq` is a superclass of
`Ord`.

We fix this by removing the constraint which is marked as redundant in the error
message, namely `Eq a`. Note that we can still use the `(==)` method of `Eq` in
the body of `f` because of the aforementioned superclass constraint.
