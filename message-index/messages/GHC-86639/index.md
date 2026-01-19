---
title: Cannot derive an instance without a corresponding language extension
summary: A language extension must be turned on for a typeclass to be derived.
severity: error
introduced: 9.6.1
---

Some typeclasses can be derived automatically in the `deriving` declaration, but
require a certain language extension to be turned on.

For example, to derive `Functor` on a datatype, the `DeriveFunctor` language
extension must be turned on.

There are many available language extensions for deriving instances, the
appropriate extension depends on the typeclass -- for example, deriving `Functor`
requires the `DeriveFunctor` language extension, deriving `Generic` requires
`DeriveGeneric`, and deriving `Lift` requires `DeriveLift`, among others.

There is more info on deriving instances for extra typeclasses in the [GHC user
manual](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/deriving_extra.html).
