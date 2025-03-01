---
title: Identical Instance Heads
---

Even though the instances have different constraints, they are still considered the same.

## Error message

```
messages/GHC-59692/example1/before/Example1.hs:3:10: error: [GHC-59692]
    Duplicate instance declarations:
      instance Eq a => Eq (T a)
        -- Defined at messages/GHC-59692/example1/before/Example1.hs:3:10
      instance Show a => Eq (T a)
        -- Defined at messages/GHC-59692/example1/before/Example1.hs:6:10
  |
3 | instance Eq a => Eq (T a) where
  |          ^^^^^^^^^^^^^^^^
```
