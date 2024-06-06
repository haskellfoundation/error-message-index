---
title: Cannot reify type because name is not in scope
summary: A Template Haskell error indicating that the given name is not in scope and therefore cannot be reified.
severity: error
introduced: 9.6.1
---

The [Template Haskell] [`reifyType`][haddock-reifyType] function
returns the type or kind of a given name:

```haskell
reifyType :: Name -> Q Type
```

If the name is not in scope, GHC fails with error **GHC-24922**.
The name has possibly been misspelled, or needs to be defined or
brought into scope.

[Template Haskell]: https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/template_haskell.html
[haddock-reifyType]: https://hackage.haskell.org/package/template-haskell-2.22.0.0/docs/Language-Haskell-TH.html#v:reifyType
