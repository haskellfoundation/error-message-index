---
title: Found 'qualified' after the module
summary: qualified after the module requires the ImportQualifiedPost extension.
severity: error
introduced: 8.10.1
---

The [`ImportQualifiedPost extension`](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/import_qualified_post.html),
allows you to put the `qualified` keyword after the module in imports, without
this it must be before the module.
This is part of the [`GHC2021`](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/control.html#extension-GHC2021)
extension set.
