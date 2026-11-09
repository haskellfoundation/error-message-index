---
title: Incorrect type variable on the LHS of injectivity condition
summary: An injectivity annotation must put the type family's result variable on the left-hand side.
severity: error
introduced: 9.6.1
---

This error occurs when the variable on the left-hand side of an injectivity annotation is not the type family's result variable.

Type families in Haskell define type-level functions. In `type family F a = r | r -> a`, the injectivity annotation `| r -> a` states that the result type `r` uniquely determines the input type `a`: equal results imply equal inputs. The left-hand side must be the result variable `r` named after `=`, and the right-hand side lists the input variables determined by that result.
