---
title: Type equality not in scope
summary: The type equality operator has not been imported into the current module.
severity: warning
flag: "-Wtype-equality-out-of-scope"
introduced: 9.6.1
---

In versions of GHC prior to 9.4.1, the type equality operator `~` was built-in syntax. In more recent versions, it is an ordinary operator that is part of the `Prelude` and of `Data.Type.Equality`. Restricting imports from `Prelude` can result in `~` not being imported, as can the use of a custom prelude that has not been updated to export `~`. For now, GHC has a compatibility warning to help migrate old code. In a future version of GHC, this warning will be an error.
