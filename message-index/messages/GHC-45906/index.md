---
title: Illegal standalone kind signature
summary: Program contains a standalone kind signature, but the active extensions do not allow it.
severity: error
introduced: 9.6.1
---

[Standalone kind signatures] can be used to specify a polymorphic
kind for a type, to overcome kind inference restrictions:

```haskell
type T :: (k -> Type) -> k -> Type  -- standalone kind signature
data T m a = MkT (m a) (T Maybe (m a))
```

Without the standalone kind signature, GHC would infer the kind
`T :: (Type -> Type) -> Type -> Type`.

Use of this feature requires the `StandaloneKindSignatures`
extension to be enabled.  This extension is implied by
`UnliftedDatatypes`, and included in the `GHC2021` and `GHC2024`
language editions.

[Standalone kind signatures]: https://downloads.haskell.org/ghc/latest/docs/users_guide/exts/poly_kinds.html?highlight=standalonekindsignatures#extension-StandaloneKindSignatures
