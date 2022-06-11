---
title: Deriving Int
---

## Error Message

```
DerivingInt.hs:4:12: error: [GHC-11913]
    • Illegal deriving item ‘Int’
    • In the data declaration for ‘Example’
  |
4 |   deriving Int
  |            ^^^
```

## Explanation

In this example, the programmer attempts to deriving `Int`, which is not a type class.
