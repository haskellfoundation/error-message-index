---
title: Cannot derive instance without constructors in scope
summary: It is not possible to derive a typeclass instance if the constructors of the type are not in scope
severity: error
introduced: 9.6.1
---

Deriving an instance of a typeclass for a type is only possible if the constructors of the type are in scope at the point where you want to derive the instance.
