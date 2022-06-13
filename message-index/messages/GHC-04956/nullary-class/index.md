---
title: Deriving instances for nullary classes
---
## Error Message
```
NullaryClass.hs:7:1: error: [GHC-04956]
    • Can't make a derived instance of
        ‘ThisClassHasNoParameters’ with the stock strategy:
        Cannot derive instances for nullary classes
    • In the stand-alone deriving instance for
        ‘ThisClassHasNoParameters’
  |
7 | deriving stock instance ThisClassHasNoParameters
  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
```

## Explanation

The class `ThisClassHasNoParameters` is a nullary class, which means that it takes no type parameters. Ordinarily, `deriving` only works for classes with a single parameter, and that check is carried out by a different part of the compiler that emits a different message. However, `StandaloneDeriving` allows the specification of type class derivation tasks that take an arbitrary number of arguments.

Ordinarily, the derived instance of `ThisClassHasNoParameters` would be performed using `DeriveAnyClass`, which fills in the instance body with zero method definitions. The [deriving strategy](https://gitlab.haskell.org/ghc/ghc/-/wikis/commentary/compiler/deriving-strategies) `stock` pushes GHC to use a different method for instance derivation that requires non-nullary classes, resulting in this error.
