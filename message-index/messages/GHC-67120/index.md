---
title: Missing main
summary: Missing main action
severity: error
introduced: 9.8.1
---

According to the second paragraph of Chapter 5 of The Haskell 98 Report,
>  A Haskell program is a collection of modules, one of which, by convention, must be called Main and must export the value main. The value of the program is the value of the identifier main in module Main, which must be a computation of type IO t for some type t (see Chapter 7). When the program is executed, the computation main is performed, and its result (of type t) is discarded.

## Example error text
```
error: [GHC-67120]
    The IO action ‘main’ is not defined in module ‘Main’
  |
1 | module Main where
  | ^
```
