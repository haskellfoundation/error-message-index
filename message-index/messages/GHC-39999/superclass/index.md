---
title: Missing superclass declaration
---

### Error message on GHC 9.6.2

```
Main.hs:5:10: error: [GHC-39999]
    • Could not deduce ‘Show (Foo a)’
        arising from the head of a quantified constraint
        arising from the superclasses of an instance declaration
      from the context: Show a
        bound by a quantified context at Main.hs:5:10-18
    • In the instance declaration for ‘Show1 Foo’
  |
5 | instance Show1 Foo where
  |          ^^^^^^^^^
```

## Explanation

The [`Show1`](https://hackage.haskell.org/package/base-4.18.0.0/docs/Data-Functor-Classes.html#t:Show1) class has
changed in GHC 9.6 to require a quantified superclass constraint `Show`. To fix this error, for every `instance
Show1` declaration add a corresponding `instance Show` declaration for the same data type.
