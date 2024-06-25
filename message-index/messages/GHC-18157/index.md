---
title: GHC stage restriction
summary: A local name is used in a top-level splice, quasi-quote or annotation.
severity: error
introduced: 9.8.1
---

A top-level
[Template Haskell splice](https://downloads.haskell.org/ghc/latest/docs/html/users_guide/exts/template_haskell.html#syntax),
[quasi-quote](https://downloads.haskell.org/ghc/latest/docs/users_guide/exts/template_haskell.html#template-haskell-quasi-quotation)
or
[source annotation](https://downloads.haskell.org/ghc/latest/docs/users_guide/extending_ghc.html#source-annotations).
cannot directly call a variable bound in the same module.
