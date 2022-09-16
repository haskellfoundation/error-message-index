---
title: Varying numbers of arguments
---

In this example, the function `f` has type `Num a => Maybe a -> a -> a`. Even though each case of the definition can have this type on its own, one of them has a single argument to the left of the `=` and a lambda on the right-hand side, and the other has two arguments to the left of the `=`. In Haskell, each defining equation must have the same number of arguments prior to the `=`.

The program was fixed by moving the lambda's argument to the left of the `=`.

## Error Message

```
Main.hs:2:1: error: [GHC-91938]
    Equations for ‘f’ have different numbers of arguments
      Prog.hs:2:1-19
      Prog.hs:3:1-20
  |
2 | f Nothing = \x -> x
  | ^^^^^^^^^^^^^^^^^^^...
```

