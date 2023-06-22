---
title: Found 'qualified'  after the module
---

This file is written in `Haskell2010` which doesn't have the
`ImportQualifiedPost` extension. To fix this you need to either turn on
`ImportQualifiedPost`, or change the `qualified` keyword to be prefix.

## Error Message
```
ImportQualifiedPost:5:16: error: [GHC-87491]
    Found `qualified' in postpositive position.
    Suggested fix: Perhaps you intended to use ImportQualifiedPost
  |
5 | import Prelude qualified
  |                ^^^^^^^^^
```
