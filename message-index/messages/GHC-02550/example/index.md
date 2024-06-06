---
title: Bad quantified constraint in function type
---

In this example, a quantified constraint occurs in the type of a binding.
Because the head of the quantified constraint is computed from a type family, we
get the following error message:

```
• Quantified predicate must have a class or type variable head:
    a => A a
• In the quantified constraint ‘a => A a’
  In the type signature: f :: (a => A a) => ()
```

One potential fix for this is to convert the type family into a class.
