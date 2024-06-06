---
title: Missing Boot Export
summary: An hs-boot file exports a datatype that isn't found in its corresponding .hs file
severity: error
introduced: 9.8.1
---

Any datatype that is exported from an .hs-boot file must be exported from the
corresponding .hs file.

More information on .hs-boot modules is available in [the GHC user manual](https://downloads.haskell.org/ghc/latest/docs/users_guide/separate_compilation.html#how-to-compile-mutually-recursive-modules).
