---
title: Precedence parsing error
summary: Cannot determine the order of operators in an expression
severity: error
introduced: 9.6.1
---

Haskell widely uses operators such as `($)`, `(.)` and `(-)` and allows users to define their own. If multiple operators are used in the same expression without brackets, it might be unclear to GHC in which order to apply them, even in the presence of fixity declarations such as `infix` / `infixl` / `infixr`.

The most robust way to disambiguate parsing is to add brackets.
