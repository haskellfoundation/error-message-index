---
title: Constraint tuple arity too large
summary: A constraint cannot be defined on a tuple with a big arity
severity: error
introduced: 9.6.1
---

GHC limits tuples to 64 elements, you cannot define constraints on bigger arity.
