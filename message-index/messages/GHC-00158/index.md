---
title: Cannot derive instance for non-stock-deriveable class
summary: An instance cannot be derived because the class is not stock deriveable.
severity: error
introduced: 9.6.1
---

GHC cannot create derived instances for classes that are not deriveable through its [stock deriving mechanism](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/deriving.html).

This restriction can be relaxed by enabling the [`DeriveAnyClass` language extension](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/derive_any_class.html), in which case GHC will generate an empty instance declaration, with no explicitly-defined methods.

Additionally, this error can appear when incorrectly specifying the `stock` strategy for a `deriving` clause if the [`DerivingStrategies` language extension](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/deriving_strategies.html) is enabled.
