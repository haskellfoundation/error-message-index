---
title: Type application with non-annotated expression
---

The lambda expression `(\x -> x)` has no type annotation, thus the application to the type argument `Int` is forbidden.
To fix the error, one can remove the type application or add a type annotation.

## Error Message

```
TypeForTermArg.hs:5:10: error: [GHC-95781]
    • Cannot apply expression of type ‘p1 -> p1’
      to a visible type argument ‘Int’
    • In the expression: (\ x -> x) @Int 12
      In an equation for ‘lamApp’: lamApp = (\ x -> x) @Int 12
  |
5 | lamApp = (\x -> x) @Int 12
  |          ^^^^^^^^^^^^^^^^^
```
