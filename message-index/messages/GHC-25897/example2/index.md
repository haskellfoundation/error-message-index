---
title: Binding a `GADT` constructor in `let`
---

In this example, we use a `let` binding to unpack the constructor of a GADT. Naively, this should work fine, because there is only one constructor. Yet GHC does not accept this code!

The fix is to use pattern-matching, either with a `case` or by pattern-matching in a function argument.

For more details about why this is necessary, see the [GHC user guide on ExistentialQuantification](https://downloads.haskell.org/ghc/latest/docs/users_guide/exts/existential_quantification.html#restrictions).

Note: if the `TypeFamilies` extension is active, [GHC-46956](/messages/GHC-46956) is generated instead.

## Message

```
Let.hs:8:18: error: [GHC-25897]
    • Couldn't match expected type ‘p’ with actual type ‘a’
      ‘a’ is a rigid type variable bound by
        a pattern with constructor:
          MkShowable :: forall a. Show a => a -> Showable,
        in a pattern binding
        at Let.hs:8:7-18
      ‘p’ is a rigid type variable bound by
        the inferred type of x :: p
        at Let.hs:8:7-29
    • In the pattern: MkShowable x
      In a pattern binding: MkShowable x = showable
      In the expression: let MkShowable x = showable in show x
  |
8 |   let MkShowable x = showable
  |                  ^
```
