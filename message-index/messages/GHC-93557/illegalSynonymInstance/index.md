---
title: Cannot implement a typeclass for type synonyms by default
---

The programmer defined a data type `RGB`, and a type synonym `T`, and then tried to implement an instance of the type class `Eq` for `T`.
In the language version Haskell 2010 this is not allowed, since all type class instances have to start with a type constructor.
This problem can be fixed by implementing the typeclass instance directly for the type `RGB` instead of the type synonym `T`.

```
messages/GHC-93557/illegalSynonymInstance/before/IllegalSynonymInstance.hs:8:10: error: [GHC-93557]
    • Illegal instance declaration for ‘Eq T’:
        All instance types must be of the form (T t1 ... tn)
        where T is not a synonym.
    • In the instance declaration for ‘Eq T’
    Suggested fix: Perhaps you intended to use TypeSynonymInstances
  |
8 | instance Eq T where
  |          ^^^^
```
