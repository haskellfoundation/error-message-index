---
title: Run whole executable
summary: Cabal runs executables but not modules
severity: error
introduced: 3.12.1.0
---

Self-contained, single-file Cabal scripts cannot also be part of a package, as
an executable or listed as a module of any package component.

Let's say we have a Cabal script, `myscript.hs`:

```haskell
#!/usr/bin/env cabal
{- cabal:
build-depends:
    base,
    haskell-say ^>=1.0.0.0
-}

import HaskellSay (haskellSay)

main :: IO ()
main = haskellSay "Hello, Haskell!"
```

We can run this with `cabal run` or with `./myscript.hs`.

```
$ cabal run myscript.hs
    ________________________________________________________
   /                                                        \
  | Hello, Haskell!                                          |
   \____       _____________________________________________/
        \    /
         \  /
          \/
    _____   _____
    \    \  \    \
     \    \  \    \
      \    \  \    \
       \    \  \    \  \-----------|
        \    \  \    \  \          |
         \    \  \    \  \---------|
         /    /  /     \
        /    /  /       \  \-------|
       /    /  /    ^    \  \      |
      /    /  /    / \    \  \ ----|
     /    /  /    /   \    \
    /____/  /____/     \____\
```

Once we add this script to a package then we lose the ability to run the script
by specifying its module name. An executable name from the package must be used
instead. Moreover, any module included in a package is not runnable by itself
with `cabal run`.

```
$ cat script-exclusivity.cabal
cabal-version: 3.0
name: script-exclusitivity
version: 1

executable my-script-exe
    build-depends:
        base,
        haskell-say
    main-is: myscript.hs

$ ./myscript.hs
Error: [Cabal-7070]
The run command can only run an executable as a whole, not files or modules
within them, but the target 'myscript.hs' refers to the file myscript.hs in the
executable my-script-exe.

$ cabal run myscript.hs
Error: [Cabal-7070]
The run command can only run an executable as a whole, not files or modules
within them, but the target 'myscript.hs' refers to the file myscript.hs in the
executable my-script-exe.
```
