---
title: Multiple Haddock comments
summary: Multiple Haddock comments for a single entity are not allowed
severity: warning
flag: -Winvalid-haddock
introduced: 9.6.1
---

Haddock provides multiple ways of adding documentation strings to entities such as types, constructors or functions. If more than one way is used to document an entity, all but the first documentation comment are ignored, and this warning is emitted.
