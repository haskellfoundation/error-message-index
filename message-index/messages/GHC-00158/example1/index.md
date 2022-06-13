---
title: Cannot derive instance for non-stock-deriveable class
---

GHC cannot derive an instance for `MyClass`, as it is not stock deriveable. Enabling the `DeriveAnyClass` language extension allows the example to compile.

## Error Message

```haskell
NotStockDeriveable.hs:6:12: error: [GHC-00158]
    • Can't make a derived instance of ‘MyClass MyType’:
        ‘MyClass’ is not a stock derivable class (Eq, Show, etc.)
    • In the data declaration for ‘MyType’
    Suggested fix: Perhaps you intended to use DeriveAnyClass
  |
6 |   deriving MyClass
  |            ^^^^^^^
```
