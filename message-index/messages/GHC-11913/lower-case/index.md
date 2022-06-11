---
title: Lowercase type class name
---

## Error message

```
LowerCase.hs:4:13: error: [GHC-11913]
    • Illegal deriving item ‘show’
    • In the data declaration for ‘Example’
  |
4 |   deriving (show)
  |             ^^^^
```

## Explanation

Type classes in Haskell begin with an uppercase letter. Writing a lowercase name results in a type variable, rather than a type class, which is not a class that can be derived. Fix the situation by capitalizing the class name.


