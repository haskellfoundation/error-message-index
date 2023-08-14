---
title: Illegal use of linear functions
summary: The linear function type is used, but LinearTypes are not enabled
severity: error
introduced: 9.6.1
---

Starting with version 9.0, GHC supports linear types.
These types allow the programmer to express how often the argument to a function is used in the function body.
For this reason, a new function type `a %1 -> b` has been introduced which stands for *linear* functions which use their argument of type `a` exactly once.
In order to use these functions, however, the extension `LinearTypes` has to be enabled.
