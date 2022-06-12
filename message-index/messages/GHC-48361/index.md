---
title: Binding type variables is not allowed in pattern bindings
summary: You can only bind value-level variables in a pattern, not type variables.
severity: error
introduced: 9.6.1
---

Patterns can bind constructor arguments to variables, but they are not able to bind type arguments to type variables.
