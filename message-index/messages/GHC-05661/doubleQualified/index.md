---
title: The module Prelude is incorrectly imported as qualified
---

In this example, the `qualified` modifier was used both before and after the name of the module which is imported.
This is not legal syntax, and GHC emits this error message.
The error can be fixed by removing one of the two occurrences.

```
messages/GHC-05661/doubleQualified/before/DoubleQualified.hs:4:26: error: [GHC-05661]
    Multiple occurrences of 'qualified'
  |
4 | import qualified Prelude qualified
  |                          ^^^^^^^^^
```
