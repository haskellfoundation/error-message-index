---
title: Deriving `Typeable` has no effect
summary: The type class `Typeable` does not need to be derived.
severity: warning
flag: -Wderiving-typeable
introduced: 9.6.1
---

This warning occurs when trying to derive an instance of the `Typeable` class.
Deriving `Typeable` is not necessary as all types automatically derive `Typeable`.
