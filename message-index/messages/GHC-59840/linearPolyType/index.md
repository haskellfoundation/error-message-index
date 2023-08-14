---
title: <insert a title for this example here>
---

This example of an interaction between multiplicities and type equalities was discussed in the[GHC proposal](https://github.com/ghc-proposals/ghc-proposals/pull/111#issuecomment-438125526) which introduced linear types.
There is no theoretical problem with this program, but the type inference mechanisms that GHC currently uses cannot typecheck it.

```
messages/GHC-59840/linearPolyType/before/LinearPolyType.hs:14:1: error: [GHC-59840]
    GHC bug #19517: GHC currently does not support programs using GADTs or type families to witness equality of multiplicities
   |
14 | dep STrue x = x
   | ^^^^^^^^^^^^^^^...
```
