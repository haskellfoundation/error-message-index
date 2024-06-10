---
title: Empty record syntax in type constructor argument
---

A type constructor such as `IO` can be applied to a type variable, (e.g. `a`), or a type (e.g. `Int`, `[Bool]`, `(a,Int,b->Int)`). `{}` is neither of those. The unit type `()` can be used instead of an empty record type when the return value of the `IO` operation is irrelevant or meant to be discarded.
