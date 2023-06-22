---
title: Values of Different Types
order: 0
---

Function `inc` has type `Int -> Int`, hence it expects an argument
of type `Int`; yet, on the definition of `two` it was called with
an argument of type `String`.

If you ever need to know the type of something, you can ask for it in `ghci`
with the command `:type` (or its shorthand `:t`):

```
ghci> :t "x"
"x" :: String
```

## Error Message

```
Terms.hs:6:11: error: [GHC-83865]
    • Couldn't match type ‘[Char]’ with ‘Int’
      Expected: Int
        Actual: String
    • In the first argument of ‘inc’, namely ‘"x"’
      In the expression: inc "x"
      In an equation for ‘two’: two = inc "x"
  |
4 | two = inc "x"
  |
```
