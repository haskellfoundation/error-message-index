---
title: Deriving ‘Typeable’ has no effect
---

## Error Message
```
Main.hs:9:12: warning: [-Wderiving-typeable] [GHC-90584]
    • Deriving ‘Typeable’ has no effect: all types now auto-derive Typeable
    • In the data declaration for ‘Foo’
  |
9 |   deriving Typeable
  |            ^^^^^^^^
```
