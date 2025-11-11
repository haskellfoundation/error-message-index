---
title: static forms cannot be used in splices
summary: Static forms are disallowed in splices
severity: error
introduced: 9.6.1
---

```
static.hs:7:45: error: [GHC-12219]
    • static forms cannot be used in splices: static 'a'
    • In the untyped splice: $(lift (show $ staticKey $ static 'a'))
```

GHC does not support using a static form in a splice, i.e. obtaining a reference
to a `StaticPtr` at compile time
