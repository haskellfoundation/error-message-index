---
title: Misplaced language pragma
---

LANGUAGE pragmas need to come before the `module` keyword.
In the example below, the `RecursiveDo` pragma is placed after the module keyword. Therefore, there's an additional error on line 10 suggesting that the `RecursiveDo` extension should be enabled. This is because language pragmas placed below the module header are ignored.

## Error Message
```
Main.hs:5:1: warning: [-Wmisplaced-pragmas] [GHC-28007]
    Misplaced LANGUAGE pragma
    Suggested fix:
      Perhaps you meant to place it in the module header?
      The module header is the section at the top of the file, before the ‘module’ keyword
  |
5 | {-# LANGUAGE RecursiveDo #-}
  | ^^^^^^^^^^^^
[1 of 2] Compiling Main             ( Main.hs, Main.o )

Main.hs:10:9: error: [GHC-88464]
    Variable not in scope: mdo :: a -> a
    Suggested fixes:
      • Perhaps use ‘mod’ (imported from Prelude)
      • Perhaps you intended to use RecursiveDo
   |
10 | foo x = mdo x

```
