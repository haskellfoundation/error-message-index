---
title: Double role annotation on datatype
---

## Error Message

```
DoubleRoleAnnotationOnData.hs:6:1: error: [GHC-97170]
    Duplicate role annotations for ‘Foo’:
      type role Foo nominal
          -- written at DoubleRoleAnnotationOnData.hs:5:1-21
      type role Foo representational
          -- written at DoubleRoleAnnotationOnData.hs:6:1-30
  |
6 | type role Foo representational
  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
```

