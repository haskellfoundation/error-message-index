---
title: Duplicate Instances
summary: Multiple instances defined for the same type class and type.
severity: error
introduced: 9.6.1
---

For type class coherence, at most one instance may be defined for each type for the same type class.

Identical instances should simply be removed.
If for the same type diverging instances are required, circumventing this restriction is possible by introducing a `newtype` wrapper.
