---
title: GADT pattern match must have a known result type
summary: A pattern match on a GADT cannot succeed unless GHC knows the result type of the pattern match.
severity: error
introduced: 9.6.1
---

A pattern match on a GADT cannot succeed unless GHC knows the result
type of the pattern match, for example because the pattern match has a
type signature, or because the type of the pattern match can be
inferred from its context.

To solve the problem you must somehow tell GHC the type of the pattern
match.  For example, in the below error message GHC suggests giving
the pattern match a type signature.

```
example1.hs:14:9: error: [GHC-25897]
    • Could not deduce ‘p ~ Bool’
      from the context: x ~ A
        bound by a pattern with constructor: FA :: F A,
                 in a \case alternative
        at test17.hs:14:3-4
      ‘p’ is a rigid type variable bound by
        the inferred type of foo1 :: F x -> p
        at test17.hs:(13,1)-(15,13)
    • In the expression: True
      In a \case alternative: FA -> True
      In the expression:
        \case
          FA -> True
          FB -> False
    • Relevant bindings include
        foo1 :: F x -> p (bound at test17.hs:13:1)
    Suggested fix: Consider giving ‘foo1’ a type signature
   |
14 |   FA -> True
   |         ^^^^
```
