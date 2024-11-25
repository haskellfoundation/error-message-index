---
title: Conflicting definitions
summary: The same entity has more than one definition
severity: error
introduced: 9.8.1
---

GHC does not allow the same entity to have more than one
definition. In some contexts it can figure out which one
is supposed to shadow another: local definitions take
priority over global definitions, etc. Shadowing is just a warning, GHC-63397. However, if the definitions are on the same
level it becomes a fatal error.
