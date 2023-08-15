---
title: GHC does not support GADTs or type families which witness equality of multiplicities
summary: GHC does not support GADTs or type families which witness equality of multiplicities
severity: error
introduced: 9.6.1
---

There are two features which GHC supports, and whose interaction is problematic and leads to this error:

- Programming constructs which build upon the type equality constraint `a ~ b`, such as GADTs and type families.
- Linear types, which supports functions like `a %m -> b`. In this function type `m` stands for a *multiplicity* which can be either `One`(also written `1`) or `Many`, which determines how often the argument to the function may be used in the body of the function.

Problems arise when the type equality constraint `a ~ b` is used for multiplicities, i.e. when we encounter equalities like `m1 ~ m2`.
Until the interaction between equality constraints and multiplicities is better understood, GHC decides to not support equalities between multiplicities, or features which require them.

More information about this particular interaction can be found on the [GHC issue tracker](https://gitlab.haskell.org/ghc/ghc/-/issues/19517).
