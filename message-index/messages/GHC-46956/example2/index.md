---
title: Binding a `GADT` constructor in `let`
---

In this example, we use a `let` binding to unpack the constructor of a GADT. Naively, this should work fine, because there is only one constructor. Yet GHC does not accept this code!

The fix is to use pattern-matching, either with a `case` or by pattern-matching in a function argument.

For more details about why this is necessary, see the [GHC user guide on ExistentialQuantification](https://downloads.haskell.org/ghc/latest/docs/users_guide/exts/existential_quantification.html#restrictions).

Note: this example generates GHC-46956 because the `TypeFamilies` extension is active. If it isn't, [GHC-25897](/messages/GHC-25897) is generated instead.

## Message

```
Let.hs:9:18: error: [GHC-46956]
    • Couldn't match expected type ‘a0’ with actual type ‘a’
        because type variable ‘a’ would escape its scope
      This (rigid, skolem) type variable is bound by
        a pattern with constructor:
          MkShowable :: forall a. Show a => a -> Showable,
        in a pattern binding
        at Let.hs:9:7-18
    • In the pattern: MkShowable x
      In a pattern binding: MkShowable x = showable
      In the expression: let MkShowable x = showable in show x
  |
9 |   let MkShowable x = showable
  |                  ^
```
