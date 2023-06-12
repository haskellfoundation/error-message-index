---
title: Type Mismatch
summary: You provided a value of a given type, whereas GHC expected a different type.
severity: error
introduced: 9.6.1
---

GHC expected one type, but was given another. Unlike dynamically-typed programming languages,
type signatures in Haskell are like a contract between the programmer and the compiler.
In its simplest form, when you call a function `f` with type `a -> b`, with some argument `x`,
the compiler will check whether `x` has type `a` and if that is not the case, it will trigger
the type mismatch error. This case is illustrated by the `terms` example, below.

Type mismatch errors are quite general, however, so you will still encounter them
in many other situations.
