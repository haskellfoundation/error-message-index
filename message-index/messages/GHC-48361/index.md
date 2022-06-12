---
title: Binding type variables is not allowed in pattern bindings
summary: You can only bind value-level variables in a pattern, not type variables.
severity: error
introduced: 9.6.1
---

Patterns bind values to variables.  It would be interesting to allow
for types variables, which you could then use in type annotations on
the right-hand side.  But this is not supported by this ghc version.
