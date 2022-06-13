---
title: Case expression in function argument pattern
---

The pattern on the left-hand side of the function definition contains a `case ... of ...` expression.

## Error Message

```
CaseExprInFunctionDef.hs:3:4: error: [GHC-53786]
    (case ... of ...)-syntax in pattern
  |
3 | f (case x of { Nothing -> 0; Just a -> a }) = a
  |    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
```
