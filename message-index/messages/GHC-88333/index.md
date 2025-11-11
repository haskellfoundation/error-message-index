---
title: Incorrect type variable on the LHS of injectivity condition
summary: Injectivity annotations are used to constrain type families, so that for a given input type, there is exactly one output type.
severity: error
introduced: 9.6.1
---

This error is about the incorrect use of type variables in the injectivity condition of type families.

Type families in Haskell are a way to define type-level functions. An injectivity annotation (| a -> r) is used to specify that for a given input type a, there is exactly one output type r that the type family can map to.
