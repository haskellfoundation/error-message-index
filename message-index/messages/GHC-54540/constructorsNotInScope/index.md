---
title: Cannot derive an instance for an abstract type
---

The `Handle` type is abstract and does not export its constructors. It is therefore not possible to derive an instance of a typeclass for the `Handle` type in another module. You can only derive an instance of a typeclass in the module where `Handle` is defined.

````
messages/GHC-54540/constructorsNotInScope/before/ConstructorsNotInScope.hs:6:1: error: [GHC-54540]
    • Can't make a derived instance of ‘Eq Handle’:
        The data constructors of ‘Handle’ are not all in scope
          so you cannot derive an instance for it
    • In the stand-alone deriving instance for ‘Eq Handle’
  |
6 | deriving instance Eq Handle
  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^
```
