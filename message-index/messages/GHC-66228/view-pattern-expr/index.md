---
title: View pattern in expression
---
## Message
```
ViewPatternExpr.hs:3:6: error: [GHC-66228]
    View pattern in expression context: sqrt -> y
  |
3 | h = (sqrt -> y)
  |      ^^^^^^^^^
```

## Explanation

In this context, the view pattern is being used instead of a function.
The issue can be corrected by not using a view pattern.
