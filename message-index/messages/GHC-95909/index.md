---
title: Missing strict fields
summary: Constructor does not have required strict field(s)
severity: error
introduced: 9.6.1
---

When strict fields are in use for a datatype -- either per-field with `BangPatterns` or for an entire type using the language extensions `Strict`/`StrictData` -- all fields are strictly evaluated by constructors. Therefore, it is not possible to leave some fields unassigned, because they can't be given a suspended bottom as a placeholder.

Therefore, it is required that *all* strict fields for a constructor are assigned on construction of the type.