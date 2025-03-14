---
title: Duplicate function arguments
---

```
Lib.hs:4:14: error: [GHC-10498]
    • Conflicting definitions for ‘x’
      Bound at: Lib.hs:4:14
                Lib.hs:4:16
    • In an equation for ‘areDifferent’
  |
4 | areDifferent x x = Nothing
  |
```

*Advanced topic:* somewhat surprisingly, you are allowed
to duplicate arguments of type-level functions as in

```haskell
{-# LANGUAGE DataKinds, TypeFamilies #-}
type family IsElem x xs where
  IsElem _ '[]       = 'False
  IsElem x (x ': xs) = 'True
  IsElem x (_ ': xs) = IsElem x xs
```
