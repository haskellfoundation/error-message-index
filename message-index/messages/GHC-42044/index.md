---
title: Unrecognised pragma
summary: GHC didn't recognize pragma and will thus ignore it
severity: warning
flag: -Wunrecognised-pragmas
introduced: 9.6.1
---

GHC emits a warning whenever it encounters a pragma which it doesn't recognize. In these cases it just ignores the pragma, which might not be what you want.

This can indicate a typo in pragma name, in which case fixing a typo should make the warning go away. See GHC User Guide for list of [supported pragmas](https://downloads.haskell.org/ghc/latest/docs/users_guide/exts/pragmas.html).
