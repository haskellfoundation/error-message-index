---
title: Forall-quantification not matched
order: 2
---

Function `f` takes an argument of type `forall r. r -> r`, so you might think
the function `g :: String -> String` would be suitable, because the type variable 
`r` can be instantiated to the concrete type `String`.

However, GHC 9.0 and later do not instantiate of forall-quantified variables in function arguments like that.

You can almost always fix this issue by explicitly applying arguments as shown in the "after" column below.
In fact, that is what GHC used to do automatically.
Note that this can prevent sharing in some situation, which is why it was deemed better to make this explicit.

Since GHC 9.2.4, you can also enable the `DeepSubsumption` language extension to fix this error which reverts GHC back to its old implicit behavior.

For more detailed information see:

* Youtube: [@rae: What Haskell's deep subsumption is, why we killed it, and then why we resurrected it.](https://www.youtube.com/watch?v=XMnXbBRg-B0)
* GHC Proposal: [Simplify subsumption](https://github.com/ghc-proposals/ghc-proposals/blob/master/proposals/0287-simplify-subsumption.rst)

## Error Message

```
Subsumption.hs:2:5: error: [GHC-83865]
    • Couldn't match type: String -> String
                     with: forall r. r -> r
      Expected: (forall r. r -> r) -> Int
        Actual: (String -> String) -> Int
    • In the expression: g
      In an equation for ‘f’: f = g
  |
2 | f = g
  |     ^
```