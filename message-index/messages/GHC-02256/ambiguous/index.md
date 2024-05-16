---
title: Ambiguous Record Update
---

In this example we declare two records `Foo` and `Bar` which each contain a field with the same name `foo`. In the function `blah` we use this name to update the field in a record of type `Bar`.
The compiler can successfully detect that the field `foo` that we mention in the record update can only refer to the field of the record `Bar`, but the mechanism that GHC uses for this will be deprecated in a future release, and for this reason a warning is emitted.

```
before/Ambiguous.hs:9:18: warning: [GHC-02256] [-Wambiguous-fields]
    The record update bar {foo = 5} with type Bar is ambiguous.
    This will not be supported by -XDuplicateRecordFields in future releases of GHC.
  |
9 | blah bar = bar { foo = 5 }
  |     
```

In order to make your code compile without any warnings you can put the declarations of both records in a separate module, and use qualified imports and qualified names to make it unambiguous which record field you mean.
