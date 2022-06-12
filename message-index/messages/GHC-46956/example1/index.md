---
title: An escaping kind variable
---



## Error Message

```
Main.hs:9:49: error: [GHC-46956]
    • Expected kind ‘k’, but ‘b’ has kind ‘k0’
    • because kind variable ‘k’ would escape its scope
    This (rigid, skolem) kind variable is bound by
      an explicit forall k (a :: k)
      at Main.hs:9:26-35
    • In the second argument of ‘SameKind’, namely ‘b’
      In the type signature:
        foo :: forall b. (forall k (a :: k). SameKind a b) -> ()
  |
9 | foo :: forall b. (forall k (a :: k). SameKind a b) -> ()
  |                                                 ^
```

## Explanation

In this context, the `SameKind` type requires that both of its arguments are types, and that those types have the same kind. In `foo`'s type signature, the type `b` does not have an explicitly-provided kind, which means that GHC creates a fresh kind metavariable for it. The type `a` does have an explicit kind, which is the variable `k`. Because `SameKind` is applied to both `a` and `b`, it causes `b`'s kind metavariable to be unified with `k`, but `k` comes from an inner scope and is thus not available for unification.

The error can be fixed by extending `k`'s scope to encompass `b`'s binding site.
