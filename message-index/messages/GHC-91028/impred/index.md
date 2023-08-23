---
title: Enabling Impredicativity
---

## Error
```
Impred.hs:7:8: error: [GHC-91028]
    • Couldn't match expected type ‘(forall s. ST s a) -> a’
                  with actual type ‘a0’
      Cannot instantiate unification variable ‘a0’
      with a type involving polytypes: (forall s. ST s a) -> a
    • In the expression: id runST
      In an equation for ‘test’: test = id runST
    • Relevant bindings include
        test :: (forall s. ST s a) -> a (bound at Impred.hs:7:1)
  |
7 | test = id runST
  |        ^^^^^^^^

Impred.hs:7:11: error: [GHC-91028]
    • Couldn't match expected type ‘a0’
                  with actual type ‘(forall s. ST s a1) -> a1’
      Cannot instantiate unification variable ‘a0’
      with a type involving polytypes: (forall s. ST s a1) -> a1
    • In the first argument of ‘id’, namely ‘runST’
      In the expression: id runST
      In an equation for ‘test’: test = id runST
  |
7 | test = id runST
  |           ^^^^^
```

## Explanation

Some code truly needs impredicativity. In this example, `runST` has the type `(forall s. ST s a) -> a`. Because the `forall` is nested underneath the arrow, GHC can't just provide it with a type argument - indeed, `runST` is one of the motivating examples for the utility of higher-rank polymorphism, and impredicativity removes restrictions from the uses of higher-rank functions. But applying `id` to `runST` requires instantiating the type variable in `id` to `(forall s. ST s a) -> a`, which is polymorphic.

Here, the error occurs twice: once when GHC attempts to match the type of `id`'s argument to the type of `runST`, and again when it attempts to match `id`'s return type to the type signature on `test`. In each case, the type variable `a0` from `id`'s type `forall a0. a0 -> a0` is needed.

This code can be fixed by turning on impredicative polymorphism, which implies `RankNTypes`.
