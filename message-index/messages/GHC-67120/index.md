---
title: ‘main’ not defined
summary: The IO action ‘main’ is not defined in module ‘Main’.
introduced: 9.8.1
severity: error
---

GHC expects the `Main` module to define a function called `main` which it can use as the entry point of your program.

This error can also occur in unnamed modules, because GHC will default to the module name `Main` for such modules.

If you just want GHC to produce an object file without an entry point, then you can give your module a name other than `Main` by putting a module header at the top of your file (below language pragmas and compiler options), for example as follows:

```
module Foo where
```
