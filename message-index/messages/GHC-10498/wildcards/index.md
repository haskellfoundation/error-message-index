---
title: Implicit duplication because of `RecordWildCards`
---

```
Lib.hs:8:9: error: [GHC-10498]
    • Conflicting definitions for ‘x’
      Bound at: Lib.hs:8:9-10
                Lib.hs:8:13
    • In an equation for ‘foo’
  |
8 | foo Foo{..} x = x + y
  |
```

Consider using `NamedFieldPuns` to be more explicit
about which variables are bound where.
