---
title: Noncanonical `mappend` definition.
---

## Error Message

```
NoncanonicalMappend.hs:10:3: warning: [GHC-50928] [-Wnoncanonical-monoid-instances]
    Noncanonical ‘mappend’ definition detected
    in the instance declaration for ‘Monoid A’.
    ‘mappend’ will eventually be removed in favour of ‘(<>)’
    Suggested fix:
      Either remove definition for ‘mappend’ (recommended) or define as ‘mappend = (<>)’
      See also: https://gitlab.haskell.org/ghc/ghc/-/wikis/proposal/semigroup-monoid
   |
10 |   mappend A A = A
   |   ^^^^^^^^^^^^^^^
```
