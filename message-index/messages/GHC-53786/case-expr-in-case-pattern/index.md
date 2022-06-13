---
title: Case expression in case pattern
---

The pattern being matched upon in the case expression `case x of ...` contains another case expression.

## Error Message

```
CaseExprInCasePattern.hs:5:3: error: [GHC-53786]
    (case ... of ...)-syntax in pattern
  |
5 |   case y of
  |   ^^^^^^^^^...
```
