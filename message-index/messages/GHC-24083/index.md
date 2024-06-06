---
title: Scoped type variables only appears non-injectively in declaration header
summary: a data declaration has a kind signature, where the implictly bound type variables cannot be matched up unambiguosly with the ones from the signature itself
severity: error
introduced: 9.6.4
---

The disconnected type variables error applies when kind-checking the header of a type/class declaration that has a 
separate, standalone kind signature.

For this consider:

```haskell
type S a = Type

type C :: forall k. S k -> Constraint
class C (a :: S kk) where
 op :: .. kk ..
```

Note that the class has a separate kind signature, so the elaborated decl should
look like

```haskell 
class C @kk (a :: S kk) where ..
```

But how can we "connect up" the scoped variable `kk` with the skolem kind from the
standalone kind signature for `C`?  In general we do this by unifying the two.
For example

```haskell 
type T k = (k,Type)
type W :: forall k. T k -> Type
data W (a :: (x,Type)) = ..
```

When we encounter `(a :: (x,Type))` we unify the kind `(x,Type)` with the kind `(T k)`
from the standalone kind signature.  Of course, unification looks through synonyms
so we end up with the mapping `[x :-> k]` that connects the scoped type variable `x`
with the kind from the signature.

But in our earlier example this unification is ineffective, because `S` is a
phantom synonym (and hence non-injective) that just discards its argument. So our answer to this issue is:

> if matchUpSigWithDecl fails to connect `kk` with `k`, by unification, 
> we give up and complain about a "disconnected" type variable.

The fix is easy: just add an explicit `@kk` parameter to the declaration, to bind `kk`
explicitly, rather than binding it implicitly via unification.

More discussion can be found [at ghc issue #24083](https://gitlab.haskell.org/ghc/ghc/-/issues/24083). 

This text was adapted from [Simon Peyton Jones' note on disconnected type variable, please refer to this note for more technical insight](https://gitlab.haskell.org/ghc/ghc/-/blob/2eee65e1a4f441e99b79f3dc6e7d60492e4cad78/compiler/GHC/Tc/Gen/HsType.hs#L3092-3147). 
