---
title: Illegal record syntax
summary: Empty record syntax is not supported for type constructor arguments
severity: error
introduced: 9.8.1
---

Record syntax can be used for giving names to the arguments of a value constructor in `data` or `newtype` declarations. Record syntax cannot be used in place of type constructor arguments. The reason is that Haskell does not have first class records. Record syntax is merely a shorthand for declaring named projections.

## Example error text
```
error: [GHC-89246]
    Record syntax is illegal here: {}
  |
3 | main :: IO {}
  |            ^^
```
