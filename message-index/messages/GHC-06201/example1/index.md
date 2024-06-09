---
title: No explicit implementation for method instance
---

## Error Message

```
A.hs:7:10: warning: [GHC-06201] [-Wmissing-methods]
    • No explicit implementation for
        ‘multiply’
    • In the instance declaration for ‘Calculator Int’
  |
7 | instance Calculator Int where
```

## Explanation

The type class `Calculator` requires you to implement two methods: `add` and `multiply`.
However, the example instance `instance Calculator Int` only implements the method `add` and not `multiply`
To fix this, implement the method `multiply`!
