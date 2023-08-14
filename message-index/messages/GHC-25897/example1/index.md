---
title: A pattern match, without known return type, on a GADT
---

In this example, the definition `foo` uses pattern matching on a GADT. GHC is not able to infer types for GADT pattern matches, but no type signature is provided. Following the suggestion in the error message and adding a type signature solves the problem.

Both starting files in this example are identical, but they are matched with different solutions. `Example2.hs` demonstrates that GHC's expected type need not be a concrete base type - even a type family satisfies this check.

## Message

The following message is provided for both lines 16 and 17, because GHC type checks each branch of a pattern match separately:

```
Example1.hs:16:9: error:
    • Could not deduce (p ~ Bool)
      from the context: x ~ 'A
        bound by a pattern with constructor: FA :: F 'A,
                 in a \case alternative
        at Example1.hs:16:3-4
      ‘p’ is a rigid type variable bound by
        the inferred type of foo :: F x -> p
        at Example1.hs:(15,1)-(17,13)
    • In the expression: True
      In a \case alternative: FA -> True
      In the expression:
        \case
          FA -> True
          FB -> False
    • Relevant bindings include
        foo :: F x -> p (bound at Example1.hs:15:1)
    Suggested fix: Consider giving ‘foo’ a type signature
   |
16 |   FA -> True
   |   
```
