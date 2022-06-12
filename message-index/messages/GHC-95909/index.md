---
title: Missing strict fields
summary: Constructor was not instantiated with required strict field(s).
severity: error
introduced: 9.6.1
---

When strict fields are declared for a datatype -- either per-field with a strictness flag `!`,  or for an entire type using the language extensions `Strict`/`StrictData` -- all strict fields are strictly evaluated by constructors. Therefore, it is not possible to leave some strict fields unassigned, because they can't be given a suspended bottom as a placeholder.

Therefore, it is required that *all* strict fields for a constructor are assigned on construction of the type.

If a *non-strict* field is missing, the warning [GHC-20125](/messages/GHC-20125/index.html) is emitted instead.
