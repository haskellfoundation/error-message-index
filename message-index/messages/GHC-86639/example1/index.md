---
title: Require the DerivingFunctor language extension for Functor instances
---

When deriving a `Functor` instance for a datatype in Haskell2010, the
`DerivingFunctor` language extension must be turned on. This can be done with a
pragma at the top of the file, or in build settings.

The `DerivingFunctor` extension is turned on automatically from Haskell2021
onwards.
