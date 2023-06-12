---
title: Values of Different Types
---

Function `inc` has type `Int -> Int`, hence it expects an argument
of type `Int`; yet, on the definition of `two` it was called with
an argument of type `String`.

If you ever need to know the type of something, you can ask for it in `ghci`
and ask for it with `:type` (or its shorthand `:t`):

```
ghci> :t "x"
"x" :: String
```
