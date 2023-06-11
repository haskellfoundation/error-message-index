---
title: Pattern matching on GADTs without MonoLocalBinds
---

## Message

```
GADTWithoutMonoBind.hs:7:3: warning: [GHC-58008] [-Wgadt-mono-local-binds]
    Pattern matching on GADTs without MonoLocalBinds is fragile.
    Suggested fix:
      Enable any of the following extensions: GADTs, TypeFamilies
  |
7 | f A = ()
  |   ^
```

## Explanation

When using GADTs, the type system is different in the sense that it's not 
possible to derive the principal type of the function `f`. Both
`f :: A a -> ()` and `f :: A () -> ()` can be considered the most general
typing for the function. The `MonoLocalBinds` extension uses a slightly more
conservative policy in order to be able to derive the type properly in such
cases.
