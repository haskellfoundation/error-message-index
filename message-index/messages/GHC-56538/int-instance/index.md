---
title: "Typo: lower-case class name"
---

## Error Message

```
IntInstance.hs:5:10: error: [GHC-56538]
    • Instance head is not headed by a class: someClass Int
    • In the instance declaration for ‘someClass Int’
  |
5 | instance someClass Int where
  |          ^^^^^^^^^^^^^
```

## Explanation

This example shows a typo in which a type class name is written in lower case in an instance declaration. This results in GHC treating it as a type variable, and failing when it is not a concrete class.
