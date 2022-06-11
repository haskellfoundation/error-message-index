---
title: An enumeration where the lower bound is greater than the upper bound
---

## Warning message

```
Main.hs:5:14: warning: [-Wempty-enumerations] [GHC-10190]
    Enumeration is empty
  |
5 |   let enum = [5 .. 1]
  |              ^^^^^^^^
```

## Explanation

`5` is greater than `1`, so the resulting list would be empty. This probably indicates a bug, because the most straightforward way to write the empty list is `[]`. One solution to this is to provide the second step in the enumeration so that the code will count down rather than up.
