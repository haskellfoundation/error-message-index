---
title: Duplicate Instances
summary: Multiple instances defined for the same type class and type.
introduced: 9.6.1
severity: error
---

You can only define a single instance for every type, because it must be possible to automatically resolve class constraints without any ambiguity.

If the instances are identical, you should simply remove one.
If you want multiple instances for the same type, you can circumvent this restriction by introducing a `newtype` wrapper. An example of this is shown in the solution for the "Multiple Instances for Semigroup Int" example.

Note that instances are considered the same even if they have different constraints. Only the arguments of the class are considered when matching instances. This issue is shown in the "Identical Instance Heads" example.

See the [GHC User Guide](https://downloads.haskell.org/~ghc/9.12.1/docs/users_guide/exts/instances.html) for more information on instance declarations and resolution.
