---
title: Invalid type application
summary: The expression cannot be applied to the given type argument.
severity: error
introduced: 9.6.1
---

Type application can only be performed for _specified_ type variables (see [documentation on inferred vs. specified type variables](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/type_applications.html#inferred-vs-specified-type-variables)).
If a type variables is instead inferred, i.e. the type is not annotated or the type variable is marked as inferred with braces, performing a type application for the corresponding type variable leads to this error.
