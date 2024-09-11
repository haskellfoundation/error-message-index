---
title: Duplicate instance declarations
summary: An instance has been defined twice for the same type.
introduced: 9.6.1
severity: error
---

You can only define a single instance for every type, because it must be possible to automatically resolve class constraints without any ambiguity.

Note that instances are considered the same even if they have different constraints. Only the arguments of the class are considered when matching instances.

See the [GHC User Guide](https://downloads.haskell.org/~ghc/9.10.1/docs/users_guide/exts/instances.html) for more information on instance declarations and resolution.
