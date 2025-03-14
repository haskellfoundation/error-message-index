---
title: Just a typo
---

```
Lib.hs:7:1: error: [GHC-29916]
    Multiple declarations of ‘function’
    Declared at: Lib.hs:4:1
                 Lib.hs:7:1
  |
7 | function _ = 4
  |
```

Because of a typo (`functlon` instead of `function`)
GHC parses the third equation as a definition of
`functlon` (without a type signature), while the fourth
equation becomes a separate, conflicting definition of `function`.
