---
title: Type equality not imported from Prelude
---
## Warning
```
TypeEqNotImported.hs:7:9: warning: [-Wtype-equality-out-of-scope] [GHC-12003]
    • The ‘~’ operator is out of scope.
      Assuming it to stand for an equality constraint.
    • NB: ‘~’ used to be built-in syntax but now is a regular type operator
          exported from Data.Type.Equality and Prelude.
      If you are using a custom Prelude, consider re-exporting it.
    • This will become an error in a future GHC release.
  |
7 | f :: (a ~ b) => a -> b
  |         ^
```

## Explanation
In this example, the type equality operator was not imported from the `Prelude`. To remove the warning, it must be imported.
