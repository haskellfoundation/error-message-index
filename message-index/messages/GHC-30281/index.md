---
title: Multiple `deriving` clauses
summary: Multiple `deriving` clauses are not allowed.
severity: error
introduced: 9.6.1
---

Using the `deriving` clause multiple times on the same `data` or `newtype` definition is illegal.

Can be resolved by either:

- Using deriving with a tuple (`deriving (Eq, Ord)`)
- Using the `DerivingStrategies` language extension


