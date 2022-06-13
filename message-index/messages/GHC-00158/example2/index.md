---
title: Specifying an incorrect deriving strategy
---

In this example, the `stock` strategy is incorrectly specified when deriving the `Num` class (which is not stock deriveable). The solution is to specify the `newtype` deriving strategy.

## Error Message

```haskell
IncorrectDerivingStrategy.hs:6:18: error: [GHC-00158]
    • Can't make a derived instance of
        ‘Num IntWrapper’ with the stock strategy:
        ‘Num’ is not a stock derivable class (Eq, Show, etc.)
    • In the newtype declaration for ‘IntWrapper’
  |
6 |   deriving stock Num
  |                  ^^^
```
