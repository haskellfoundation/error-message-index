---
title: Duplicate Instances
summary: Multiple instances defined for the same type class and type.
introduced: 9.6.1
severity: error
---

You can only define a single instance for every type, because it must be possible to automatically resolve class constraints without any ambiguity.

Identical instances should simply be removed.
If multiple instances for the same type are required, circumventing this restriction is possible by introducing a `newtype` wrapper.

Note that instances are considered the same even if they have different constraints. Only the arguments of the class are considered when matching instances.

See the [GHC User Guide](https://downloads.haskell.org/~ghc/9.12.1/docs/users_guide/exts/instances.html) for more information on instance declarations and resolution.