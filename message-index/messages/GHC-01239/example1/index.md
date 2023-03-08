---
title: Unexpected if expression in function application
---

To pass If-Then-Else expressions as function arguments we either have to surround them in parentheses,
use function application operator `($)` or enable [`BlockArguments`](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/block_arguments.html#extension-BlockArguments) extension.

## Error Message
```
IfInFunAppExpr.hs:4:18: error:
    Unexpected if expression in function application:
        if True then [1] else []
    Suggested fixes:
      • Use parentheses.
      • Perhaps you intended to use BlockArguments
  |
4 | example = length if True then [1] else []
  |                  ^^^^^^^^^^^^^^^^^^^^^^^^
```
