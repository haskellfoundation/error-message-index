---
title: Case expression in function argument pattern
---

The pattern in the case expression `case x of ...` contains a `case ... of ...` expression.

## Error Message

```
CaseExprInCasePattern.hs:4:3: error: [GHC-53786]
    (case ... of ...)-syntax in pattern
  |
4 |   case y of
  |   ^^^^^^^^^...
```
