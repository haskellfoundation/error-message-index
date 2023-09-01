---
title: Cannot equate polymorphic types with type variables
summary: During type inference, GHC can't instantiate a type variable with a type that is itself polymorphic.
severity: error
introduced: 9.6.1
---

During the type checking process, type variables are replaced with actual types. For example, the function `id` has type `a -> a`, which is a shorter way of writing `forall a. a -> a`. When `id` is applied to an argument, the variable `a` is _instantiated_ with the argument's type, causing `id`'s return type (and thus the whole expression) to be the same as the argument's type. This is because `id`'s type is _polymorphic_ - it contains variables that can be instantiated with many different types.

For technical reasons, type variables cannot be instantiated with types that are themselves polymorphic in Haskell. This kind of instantiation is referred to as [_impredicative_](https://en.wikipedia.org/wiki/Impredicativity), borrowing a term from logic that describes terms with quantifiers where the variable ranges over the same set as the one in which the quantifier is being used. Haskell is _predicative_, meaning that the variables of the `forall` quantifier do not range over types that themselves contain `forall`. Predicativity makes a type system much less expressive, which means that implementations are able to be more predictable for users, run faster, and give better error messages. Impredicativity is sometimes very useful, but predicativity is usually strong enough.

This error occurs when GHC is asked to instantiate a type variable with a polymorphic type, which would require impredicativity.

## Enabling Impredicativity

For some time, GHC has supported an extension called `ImpredicativeTypes`, but it was unreliable for many years. Starting in version 9.2, GHC uses a new implementation of type inference with impredicativity called [Quick Look](https://www.microsoft.com/en-us/research/publication/a-quick-look-at-impredicativity/) that is more robust than previous implementations, so `ImpredicativeTypes` is now considered suitable for serious use. If your application does require the additional power provided by impredicativity, then enabling this extension may resolve this error message. Code that uses `ImpredicativeTypes` is likely to be less compatible with GHC 9.0 and earlier due to the revamping of this extension.

## Impredicative Kinds

Types and kinds are unified into a single entity in GHC, with typing rules rather than a separate grammar being used to track the difference between them. GHC's kind system thus supports many features of the type system, including polymorphism. A definition may be polymorphic over both types and kinds. This error can also occur when GHC attempts to instantiate a kind variable with a polymorphic kind.

However, even when `ImpredicativeTypes` is enabled, GHC requires that kind polymorphism be predicative.
