---
title: Using .. in pattern 
---

When pattern matching, Expressions are not allowed as patterns to be matched against. Instead, consider matching on a list, and using a conditional. 


# Error Message

```
before_dots.hs:3:3: error: [GHC-04584]
    Expression syntax in pattern: [1 .. 10]
  |
3 | f [1..10] = 0 
  |   ^^^^^^^
```
