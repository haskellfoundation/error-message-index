---
title: Ambiguous Record Update
---

In this example we declare two records `BusinessAccount` and `PersonalAccount` which each contain a field `balance` which stores the current balance. In the function `resetPersonalAccount` we use this record field to reset the account balance of a personal account to 0.
The compiler can successfully detect that the field `balance` that we mention refers to the field of the record `PersonalAccount` and not to the field of the record `BusinessAccount`, but the mechanism that GHC uses for this is brittle and will be deprecated in a future release.
For this reason GHC emits a warning.

```
before/Accounting.hs:9:42: warning: [GHC-02256] [-Wambiguous-fields]
    The record update account
                        {balance = 0} with type PersonalAccount is ambiguous.
    This will not be supported by -XDuplicateRecordFields in future releases of GHC.
  |
9 | resetPersonalAccount account = account { balance = 0 }
  |  
```

In order to make your code compile without warnings you can put the record declarations in a separate module and use qualified imports and names to make it unambiguous which record field you mean.
