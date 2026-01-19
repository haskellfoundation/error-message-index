---
title: Term variables cannot be used here
summary: A variable defined at the level of terms cannot be directly used in type or kind signatures
severity: error
introduced: 9.10.1
---

Through using [`RequiredTypeArguments`], Haskell gets support for programming with Dependent Types.
As such, the variables at the level of terms exist at the level of types.

If you mistakenly refer to an entity that already exists as a term in your kind signature, you will get
an error about the fact that we cannot do such a thing.

In the example, the `id` function is already exposed by the Prelude, but it is also a very convenient name to label identifiers.

You can make sure that GHC understands you're declaring a type-level variable by using the [`forall`] keyword.

[`RequiredTypeArguments`]: https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/required_type_arguments.html
[`forall`]: https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/explicit_forall.html#extension-ExplicitForAll
