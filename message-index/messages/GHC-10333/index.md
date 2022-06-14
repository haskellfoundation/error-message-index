---
title: Generalized newtype deriving doesn't work on non-newtypes
summary: Generalized newtype deriving works only for types declared with the newtype keyword.
introduced: 9.6.1
severity: error
extension: GeneralizedNewtypeDeriving, DerivingStrategies
---

[Generalized newtype deriving](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/newtype_deriving.html) implements typeclass derivation for newtypes by coercing them to and from their underlying datatypes. But types that aren't declared with `newtype` cannot be coerced, so other deriving strategies must be used to derive instances for them.
