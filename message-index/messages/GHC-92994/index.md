---
title: Unexpected nested forall in foreign declaration
summary: A foreign function import uses a higher-rank type.
severity: error
extension: CApiFFI, RankNTypes
introduced: 9.6.1
---

When using the `CApiFFI` interface to C functions, there are certain restrictions placed on the Haskell types that may be assigned to foreign functions. In particular, they may not use higher-rank polymorphic types - that is, all `forall`s must be at the beginning of the type signature.

