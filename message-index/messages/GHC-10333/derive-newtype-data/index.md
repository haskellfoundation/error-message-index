---
title: Attempt to use newtype deriving for an ordinary datatype
---
## Message
```
DeriveNewtypeData.hs:5:20: error: [GHC-10333]
    • Can't make a derived instance of
        ‘Show Weekend’ with the newtype strategy:
        GeneralizedNewtypeDeriving cannot be used on non-newtypes
    • In the data declaration for ‘Weekend’
  |
5 |   deriving newtype Show
  |                    ^^^^
```

## Explanation

[Generalized newtype deriving](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/newtype_deriving.html) works only on types defined with `newtype`, but `Weekend` is defined with `data`. Ordinary deriving, however, works with types defined with `data`.
