---
title: Instance head is not headed by a class
summary: A type class instance declaration is declared for something that is not a type class.
introduced: 9.6.1
severity: error
---

Instance declarations specify the operations that place a type into a type class. For example, an instance of `Eq` describes how `(==)` works for a type. Instances only make sense for things that are, in fact, type classes - `instance Int Int` is nonsense, as is `instance thing Int`.

A _head_ is the thing being applied at the beginning of a chain of applications. For instance, in `MonadReader Int MyMonad`, the head is `MonadReader`. When there are no arguments, the head is the entire construct, so `Int` is the head of `Int`. For an instance declaration to make sense, the head of the instance being defined must be the name of a type class. The terminology here is a bit overloaded, because the instance being defined is the _instance head_, and the head of the instance head must be a class.

For example, in:
```
instance Show Int where
  ...
```
the instance head is `Show Int` and its head is `Show`.

Normally, this error is caught by a different step, where GHC uses the type system to ensure that the instance being defined is of a class. But a lower-case name is a type variable, which the type system cannot rule out.


