---
title: Multiple Instances for Semigroup Int
---

Haskell does not allow to give more than one definition of `Semigroup Int`, even though we might want to provide both an instance for the semigroup given by multiplication and the semigroup given by addition.
If we require both instances, then we should define two `newtype` wrappers for `Int`.
