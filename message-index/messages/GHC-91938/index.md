---
title: Equations have different number of arguments
summary: Each equation in a function definition must have the same number of arguments.
severity: error
introduced: 9.6.1
---

Haskell functions are defined using equations, with the function name and patterns on the left side of the `=` and expressions on the right side. When the function is applied, the patterns in the equations are checked from top to bottom, with the first matching equation being chosen.

Each equation that defines a function must have the same number of patterns to the left of the `=`.


