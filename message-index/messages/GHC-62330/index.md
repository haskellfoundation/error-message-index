---
title: Underscores not allowed in float and integer literals
summary: Float and integer literals cannot contain underscores.
severity: error
introduced: 9.6.1
---

The [`NumericUnderscores` extension](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/numeric_underscores.html) allows underscores to be included in float and integer literals for better legibility of long numbers and is enabled by default.
If the `NoNumericUnderscores` extension is enabled or `NumericUnderscores` is not enabled in earlier GHC versions, the inclusion of underscores in float and integer literals causes this error.
