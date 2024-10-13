
---
title: Double return
---

In this example, there is a nested return whose result is not bound to a variable. Therefore the computation `return 10` is not used and can be removed.

```
messages/GHC-08838/WrongDoBind/before/WrongDoBind.hs:5:4: warning: [GHC-08838] [-Wwrong-do-bind]
    A do-notation statement discarded a result of type ‘m Int’
    Suggested fix:
      Suppress this warning by saying ‘_ <- return (return 10 :: m Int)’
  |
5 |    return (return 10 :: m Int)
  |    ^^^^^^^^^^^^^^^^^^^^^^^^^^^
```
