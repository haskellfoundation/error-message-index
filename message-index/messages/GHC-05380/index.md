---
title: Multiple newtype constructors
summary: More than 1 constructor for a newtype
severity: error
introduced: 9.6.1
---

A newtype constructor can only have a single constructor. If you want multiple
constructors, you should use `data` instead of `newtype`.

The reason that you need exactly one constructor is that `newtype` constructors
are removed at runtime.
So during runtime, if you define `newtype Age = Age Int`, `Age` is the same as `Int`.
Only during the compilation phase, will the `Age` and `Int` types be different.
If we allow multiple constructors for a newtype, there would be no way to distinguish them during execution.
