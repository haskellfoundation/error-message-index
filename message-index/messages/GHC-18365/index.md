---
title: Pattern synonym arity mismatch
summary: The number of arguments in the signature of a pattern synonym is fewer than the number of arguments in its equation.
severity: error
introduced: 9.8.1
---

Just as a function definition cannot specify fewer arguments than its signature,
a pattern synonym's definition cannot specify fewer arguments than its signature.
Specifying more arguments in the signature than in the definition is OK though,
because it would just mean that the last parameter to the synonym is a function.
