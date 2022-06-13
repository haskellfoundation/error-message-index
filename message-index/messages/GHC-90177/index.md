---
title: Orphan instance
summary: An instance was defined separately from its type or class.
severity: warning
introduced: 9.6.1
flag: -Worphans
---

When writing an instance for a typeclass, the ideal situation is that this instance is defined either in the same module as the *typeclass*, or in the same module as the *datatype*. This ensures that if a module imports either the typeclass or the datatype module, the instances will also be visible.

If the instances are defined in a separate module, it becomes possible that the typeclass and the datatype are brought into scope but the *instance for that datatype* is not, leading to unexpected `No instance of Foo for type Bar`.

Whilst this is not always avoidable, it is best practice to place the instance in the module that defines either the typeclass or the datatype. Another option is to wrap the type in `newtype`, and then define an instance of the class for the *newtype* in the same module.
