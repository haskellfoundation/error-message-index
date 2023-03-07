---
title: Unexpected if expression in function application
summary: If expression used as function argument
severity: error
introduced: TODO
---

Unlike in many other languages, in Haskell the if-then-else construct is an expression, which means it returns a value that can be processed further.

```language-haskell
ageMessage :: Int -> String 
ageMessage age = if age < 18 then "You are too young to enter" else "Welcome to the club"

putStrLn (ageMessage 10) -- You are too young to enter
putStrLn (ageMessage 20) -- Welcome to the club
```

Thinking of if-then-else expression as a value, we might want to pass it as an input to a function.
If you do that you can run into the following error.