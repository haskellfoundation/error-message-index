---
title: Impredicative Kind Polymorphism
---

## Error
```
PredKinds.hs:6:13: error: [GHC-91028]
    • Expected kind ‘forall (k :: k1). a’, but ‘z’ has kind ‘k0’
      Cannot instantiate unification variable ‘k0’
      with a kind involving polytypes: forall (k2 :: k1). a
    • In the first argument of ‘Proxy’, namely ‘(z :: forall k. a)’
      In the type signature: t :: Proxy (z :: forall k. a)
  |
6 | t :: Proxy (z :: forall k. a)
  |             ^
```

## Explanation

Even when impredicative types are enabled, polymorphic kinds remain predicative. In this case, the type constructor `Proxy` has the kind `forall k. k -> Type`. This allows its argument to be any type, no matter its kind. Applying it to the type `(z :: forall k. a)` would require instantiating `Proxy`'s kind argument `k` with the polymorphic kind `forall k. a`, but this is not allowed.

The only way to fix this error is to rewrite the code so that impredicative polymorphism is not required. One way to do this is to lift the polymorphism outward, so that GHC will suitably instantiate the type `z`'s polymorphic arguments in the argument position to `Proxy`. After performing this transformation, the fully explicit type of `t` can be seen in GHCI:
```
ghci> :l PredKinds.hs
[1 of 1] Compiling PredKinds        ( PredKinds.hs, interpreted )
Ok, one module loaded.
ghci> :set -fprint-explicit-kinds
ghci> :t t
t :: forall {k1} {k2 :: k1} a (z :: forall (k3 :: k1). a).
     Proxy @{a} (z @k2)
```
Here, GHC has provided the argument `k2` to `z`, resulting in a type with a monomorphic kind `a`.
