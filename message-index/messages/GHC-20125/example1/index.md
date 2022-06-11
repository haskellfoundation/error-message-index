---
title: Uninitialized record field
---

The field `c` of the record Rec is not initialized.

## Error Message

```
GHC-20125/example1/before/Error.hs:7:5: warning: [-Wmissing-fields] [GHC-20125]
    • Fields of ‘Rec’ not initialised:
        c :: Bool
    • In the expression: Rec {a = 1, b = "two"}
      In an equation for ‘x’: x = Rec {a = 1, b = "two"}
  |
7 | x = Rec { a = 1, b = "two" }
```
