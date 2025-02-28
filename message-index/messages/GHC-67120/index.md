---
title: Missing main
summary: The IO action ‘main’ is not defined in module ‘Main’.
introduced: 9.8.1
severity: error
---

GHC expects the `Main` module to define a function called `main` which it can
use as the entry point of your program.

This error can also occur in unnamed modules, because GHC will default to the
module name `Main` for such modules.

If you just want GHC to produce an object file without an entry point, then you
can give your module a name other than `Main` by putting a module header at the
top of your file (below language pragmas and compiler options), for example as
follows:

```
module Foo where
```

The conventions around `main` are defined in the second paragraph of Chapter 5
of [The Haskell 2010 Report](https://www.haskell.org/onlinereport/haskell2010/haskellch5.html#x11-980005),

> A Haskell program is a collection of modules, one of which, by convention,
> must be called `Main` and must export the value `main`. The value of the
> program is the value of the identifier `main` in module `Main`, which must be
> a computation of type `IO t` for some type `t` (see Chapter 7). When the
> program is executed, the computation `main` is performed, and its result (of
> type `t`) is discarded.

## Example error text

```
example1/before/Lib.hs:1:1: error: [GHC-67120]
    The IO action ‘main’ is not defined in module ‘Main’
  |
1 | factorial :: Int -> Int
  | ^
```

```
example2/before/Main.hs:1:1: error: [GHC-67120]
    The IO action ‘main’ is not defined in module ‘Main’
  |
1 | notMain :: IO ()
  | ^
```
