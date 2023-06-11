---
title: Duplicate warning declarations
summary: Duplicate deprecation warnings are illegal
severity: error
introduced: 9.6.1
---

Using a deprecation pragma it is possible to declare that a Haskell entity such as a type or a toplevel function is deprecated.
It is, however, illegal to specify multiple deprecation warnings for the same entity.
