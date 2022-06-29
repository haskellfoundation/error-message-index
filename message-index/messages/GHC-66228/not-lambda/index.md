---
title: Missing lambda
---
## Message
```
NotLambda.hs:3:9: error: [GHC-66228]
    View pattern in expression context: x -> x
  |
3 | five = (x -> x) 5
  |         ^^^^^^
```

## Explanation

In this example, the programmer forgot the `\` at the beginning of their anonymous function.
This caused the parser to recognize the function as a view pattern instead of a lambda.
