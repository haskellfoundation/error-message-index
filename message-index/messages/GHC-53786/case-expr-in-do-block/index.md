---
title: Case expression in do-block
---

The expression in one branch of the case expression is a do-block that's missing a `do`; the whole case-expression is interpreted as LHS of a bind in the top-level do-block. See also: https://gitlab.haskell.org/ghc/ghc/-/issues/984

## Error Message

```
CaseExprInDoBlock.hs:5:3: error: [GHC-53786]
    (case ... of ...)-syntax in pattern
  |
5 |   case () of
  |   ^^^^^^^^^^...

```
