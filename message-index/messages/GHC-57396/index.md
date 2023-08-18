---
title: Linear types are not supported in FFI
summary: Linear types are not supported when using GHC's FFI functionality
severity: error
introduced: 9.6.1
---

If the extension `LinearTypes` is enabled, then programmers can write expressions which have the linear
function type `a %1 -> b` for functions which use their argument exactly once.
When calling external functions via GHC's FFI functionality, however, then it is not allowed to use a linear function type.

More information about this specific restriction can be found in the discussion in the [GHC issue tracker](https://gitlab.haskell.org/ghc/ghc/-/issues/18472).
