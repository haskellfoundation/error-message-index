---
title: Duplicate warning declarations
summary: Duplicate deprecation warnings are illegal
severity: error
introduced: 9.6.1
---

A Haskell entity, such as a type or a top-level definition, can be declared to be deprecated using a pragma.
It is, however, illegal to specify multiple deprecation warnings for the same entity.
