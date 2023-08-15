---
title: Illegal linear function in kind
summary: A linear function was used for a higher kind, which is not allowed
severity: error
introduced: 9.6.1
---

Haskell supports higher-kinds.
For example, the type constructor `List` has kind `* -> *`, which can also be written as `Type -> Type` if the module `Data.Kind` is imported.
Since version 9.0, GHC also supports the linear function type `a %1 -> b` which stands for functions which use their argument of type `a` exactly once in their function body.
But this restriction does not make sense if we try to apply it to higher kinds, and for this reason functions like `* %1 -> *` or `Type %1 -> Type` cannot be used as the kinds of data types.
