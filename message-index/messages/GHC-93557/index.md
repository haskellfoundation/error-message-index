---
title: Illegal typeclass instance
summary: Illegal typeclass instance
severity: error
introduced: 9.8.1
---

Using the language version Haskell2010, only certain types are allowed as instances of a typeclass.
Every typeclass instance in Haskell2010 has the following form:
```
instance C t where
````
Here, `C` is the name of a typeclass, such as `Eq`, `Show` or `Read`, and `t` is a type.
But only a subset of types `t` is allowed to appear in typeclass instances.
These types must all have the form `T` or `T a ... b`, where `T` has to be the name of a type introduced by a data or newtype declaration, and the arguments `a` to `b` all have to be type variables.
