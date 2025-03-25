---
title: Quantified predicate must have a class or type variable head
summary: The head of a quantified constraint must be either a class or a type variable
severity: error
introduced: 9.6.1
---

[Quantified constraints](https://downloads.haskell.org/ghc/9.12.1/docs/users_guide/exts/quantified_constraints.html)
are constraints which have their own constraints. The
*head* of a quantified constraint is the constraint on the right side of the
`=>` operator. For example, the head of the quantified constraint `Ord a => Eq
a` is `Eq a`. This error message states that the head of a quantified constraint
must not be a constraint resulting from, for example, a type family; it must
be either a class constraint or a type variable.
