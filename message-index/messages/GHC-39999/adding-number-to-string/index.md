---
title: Adding numbers to strings
order: 4
---

## Error message

```
Main.hs:1:16: error: [GHC-39999]
    • No instance for ‘Num String’ arising from the literal ‘5’
    • In the first argument of ‘(+)’, namely ‘5’
      In the second argument of ‘($)’, namely ‘5 + "4"’
      In the expression: print $ 5 + "4"
  |
1 | main = print $ 5 + "4"
  |                ^
```

## Explanation

Given that Haskell is a strong statically typed language, it is not a surprise that adding numbers to strings gives a compile-time error. However, one could expect GHC to be unhappy about `"4"`, not about `5` as above! Let's take a deeper look on how the type checker works.

The compiler first encounters the operator `(+)` which has type `Num a => a -> a -> a`. Thus it infers that both arguments of `(+)` should be of the same type `a`. Looking at the first argument `5` does not reveal us what `a` is: it could be `Int`, could be `Double`, etc. But the second argument `4` is certainly `String`, so the compiler concludes that `a` should be `String`.

Now the compiler looks again at the first argument `5`. Since the second argument of `(+)` is `String`, it infers that `5` must be `String` as well. In Haskell a numeric literal could be anything which has `instance Num`, so GHC searches for `instance Num String` but could not find one and bails out with an error.
