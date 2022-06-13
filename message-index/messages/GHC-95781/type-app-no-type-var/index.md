---
title: Type application with no type variable
---

The function `plus` is applied to the type argument `Int`, but its annotated type `Int -> Int -> Int` contains no type variable.

## Error Message

```
TypeAppNoTypeVar.hs:8:5: error: [GHC-95781]
    • Cannot apply expression of type ‘Int -> Int -> Int’
      to a visible type argument ‘Int’
    • In the expression: plus @Int 5 7
      In an equation for ‘x’: x = plus @Int 5 7
  |
8 | x = plus @Int 5 7
  |     ^^^^^^^^^^^^^
```
