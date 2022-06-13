---
title: Orphan instance in a separate module from definitions
---

In this example, the implementation for `IsAFoo Foo` is in a different module than both the definition for `class IsAFoo` and the datatype `Foo`. Thus, it would be possible for a user to write `import Foo` and expect to have `instance IsAFoo Foo` in scope; however, the user would need to additionally import `module OrphanInstance`.

In this case, where the definitions for both the typeclass and the type are available, the solution is to move the instance definition into the `Foo` module.

## Error Message
```
OrphanInstance.hs:5:1: warning: [-Worphans] [GHC-90177]
    Orphan instance: instance IsAFoo Foo
    To avoid this
        move the instance declaration to the module of the class or of the type, or
        wrap the type with a newtype and declare the instance on the new type.
  |
5 | instance IsAFoo Foo where
  | ^^^^^^^^^^^^^^^^^^^^^^^^^...
```
