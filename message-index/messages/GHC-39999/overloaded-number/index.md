---
title: No instance for ‘Num [Int]’ arising from the literal ‘0’
order: 5
---

## Error message

```
Lib.hs:4:17: error: [GHC-39999]
    • No instance for ‘Num [Int]’ arising from the literal ‘0’
    • In the second argument of ‘map’, namely ‘0’
      In the expression: map (+ 1) 0
      In an equation for ‘foo’: foo = map (+ 1) 0
  |
4 | foo = map (+ 1) 0
  |                 ^
```

## Explanation

Sometimes, when GHC encounters a type error, it suggests solving
it from an unexpected end. In this case, when it encouters a literal
instead of a list, it does not just complain about it. Instead it suspects
that maybe an author meant to overload numeric literals so that they can mean lists too.

Every time you write a numeric literal in Haskell,
it gets desugared using `fromInteger :: Num a => Integer -> a`. So the program above
would be absolutely valid if only `[Int]` itself (not just `Int`) was an instance of `Num`.
While such interpretation of lists is not entirely out of the realm of possibility
(say, imagine that lists represent coefficients of polynomials), it's much more likely
that `map (+ 1) 0` is just a typo.
