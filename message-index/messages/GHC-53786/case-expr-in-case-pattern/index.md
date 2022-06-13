---
title: Case expression in case pattern
---

The pattern in the case expression `case x of ...` contains a case expression.

## Error Message

```
CaseExprInCasePattern.hs:4:3: error: [GHC-53786]
    (case ... of ...)-syntax in pattern
  |
4 |   case y of
  |   ^^^^^^^^^...
```
