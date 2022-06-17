---
title: Illegal tuple constraint
summary: A tuple of constraints was used without enabling the ConstraintKinds extension
extension: ConstraintKinds
introduced: 9.6.1
severity: error
---

Constraints are the part of a signature that defines the type classes that must be implemented for the types used to instantiate the type variables, found to the left of the double arrow (`=>`).
In [Haskell 2010](https://www.haskell.org/onlinereport/haskell2010/haskellch4.html#x10-630004.1), type class constraints are either:

 * a single constraint that consists of a named class applied to arguments, or

 * multiple constraints in parentheses, separated by commas.

This strict syntax is necessary because type classes do not themselves form types in Haskell 2010.
This syntax does not admit nested parentheses or tuples.

With GHC's [`ConstraintKinds` extension](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/constraint_kind.html), type classes form types that have kind `Constraint`, and instead of checking for a specific syntactic form, the type checker ensures that the constraint section of a signature has kind `Constraint`.
Because tuples of types that have kind `Constraint` themselves have kind `Constraint`, nested tuples are allowed.
This is especially convenient when defining type synonyms that stand for tuples of constraints.
