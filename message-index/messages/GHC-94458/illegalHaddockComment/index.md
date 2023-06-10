---
title: Illegal Haddock comments for definitions in where clause
---

In this example, the user tried to document the two identifiers "fizz" and "buzz" that are introduced in a local where clause.
Since these identifiers are not part of the public API, a warning is emitted that Haddock comments are not allowed in that place.
A normal comment can be used instead.

```
messages/GHC-94458/illegalHaddockComment/before/IllegalHaddockComment.hs:5:5: warning: [GHC-94458] [-Winvalid-haddock]
    A Haddock comment cannot appear in this position and will be ignored.
  |
5 |     -- | The sound of a refreshing beverage.
  |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

messages/GHC-94458/illegalHaddockComment/before/IllegalHaddockComment.hs:7:5: warning: [GHC-94458] [-Winvalid-haddock]
    A Haddock comment cannot appear in this position and will be ignored.
  |
7 |     -- | The sound of an annoying fly.
  |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
```
