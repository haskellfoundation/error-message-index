---
title: Multiple newtype constructors
summary: More than 1 constructor for a newtype
severity: error
introduced: 9.6.1
---

A newtype can only have a single constructor. If you want multiple
constructors, you should use `data` instead of `newtype`.

The reason that you need exactly one constructor is that `newtype` constructors
are removed at runtime.
For example, if you define `newtype Age = Age Int`, the bits in memory that represent
an `Age` are identical to those that would represent the `Int` in the constructor.
The `Age` and `Int` types are distinguished only at compile time.
If types defined with `newtype` could have multiple constructors, there would be no way to distinguish them during execution.
