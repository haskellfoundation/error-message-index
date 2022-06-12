---
title: No instance arising
summary: An expression requires a type class instance which is not provided by the context.
introduced: 9.6.1
severity: error
---

This error happens when an expression in the code has a type constraint (e.g. `Eq a => a -> a`) requiring an instance of a type class but GHC can‘t find it.
This most commonly happens for two reasons: Either the type is to polymorphic (i.e. general) e.g. `forall a. a` and there is no type signature declaring that the type should have the instance. Or the type is specific e.g. `Bool`, but there is no instance for the desired type class defined for this type.
