---
title: Use of "forall" as an identifier
summary: Use of "forall" as an identifier is discouraged
severity: warning
flag: -Wforall-identifier
introduced: 9.6.1
---

The string "forall" is not a keyword in the Haskell 2010 standard.
It is therefore possible to declare a top-level function in Haskell 2010 which uses `forall` as a name.
As a result of the accepted [GHC proposal 281](https://github.com/ghc-proposals/ghc-proposals/blob/master/proposals/0281-visible-forall.rst) the string `"forall"` will become a reserved keyword in a future version of GHC, so GHC warns against the use of `forall` as an identifier.
