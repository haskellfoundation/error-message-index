---
title: Attempts to create hand-written instances for special type classes
---

Since these type classes don't allow hand-written instances, you'll get the following errors if you try to implement them.
To fix the errors, just remove the instance declarations - GHC will provide them for you automatically.

## Error Message
```
UserSpecifiedInstances.hs:9:10: error: [GHC-97044]
    • Class ‘Coercible’ does not support user-specified instances.
    • In the instance declaration for ‘Coercible Foo ()’
  |
9 | instance Coercible Foo ()
  |          ^^^^^^^^^^^^^^^^

UserSpecifiedInstances.hs:11:10: error: [GHC-97044]
    • Class ‘Typeable’ does not support user-specified instances.
    • In the instance declaration for ‘Typeable Foo’
   |
11 | instance Typeable Foo
   |          ^^^^^^^^^^^^

UserSpecifiedInstances.hs:13:10: error: [GHC-97044]
    • Class ‘~’ does not support user-specified instances.
    • In the instance declaration for ‘Foo ~ Foo’
   |
13 | instance Foo ~ Foo
   |          ^^^^^^^^^
```
