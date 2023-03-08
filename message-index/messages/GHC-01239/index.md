---
title: Unexpected if expression in function application
summary: If expression used as function argument
severity: error
introduced: 9.6.1
---

Unlike in many other languages, in Haskell the If-Then-Else construct is an expression, which means it returns a value that can be processed further.

```haskell
ageMessage :: Int -> String 
ageMessage age = if age < 18 then "You are too young to enter" else "Welcome to the club"

putStrLn (ageMessage 10) -- You are too young to enter
putStrLn (ageMessage 20) -- Welcome to the club
```

Because If-Then-Else expressions return values, it makes sense to pass them as input to a function.
However, without language extensions, Haskell's grammar requires parentheses around them in function argument positions.
