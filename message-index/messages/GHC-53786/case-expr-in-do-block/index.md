---
title: Case expression in do-block
---

The expression in one branch of the case expression is a `do`-block that's missing a `do`. This triggers a corner case in the grammar of Haskell, and the `case`-expression is interpreted as the pattern part of a bind statement in the top-level `do`-block. 

More details are available [on the GHC issue tracker, issue #984](https://gitlab.haskell.org/ghc/ghc/-/issues/984).

## Error Message

```
CaseExprInDoBlock.hs:5:3: error: [GHC-53786]
    (case ... of ...)-syntax in pattern
  |
5 |   case () of
  |   ^^^^^^^^^^...

```
