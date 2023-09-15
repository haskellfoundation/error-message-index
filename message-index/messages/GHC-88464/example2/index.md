---
title: Forgetting an import declaration
---

## Error Message

```
ForgotImport.hs:4:19: error: [GHC-88464]
    Variable not in scope: sort :: [Int] -> [Int]
    Suggested fix: Perhaps use ‘sqrt’ (imported from Prelude)
  |
4 | top10 = take 10 . sort
  |                   ^^^^
```

## Description
In this example, the programmer forgot to import the `sort` function from the `Data.List` module. The updated version adds the appropriate import declaration.
