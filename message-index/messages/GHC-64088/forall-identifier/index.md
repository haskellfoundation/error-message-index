---
title: The identifier "forall" should not be used
---

In this example the programmer implemented a function which checks whether all elements of a list satisfy a given predicate. The programmer has chosen the sensible name "forall" for this function, but this name will become a reserved keyword in a future version of GHC.
The function should therefore be renamed, for example to the name "forAll".

```
ForallIdentifier.hs:4:1: warning: [GHC-64088] [-Wforall-identifier]
    The use of ‘forall’ as an identifier
    will become an error in a future GHC release.
    Suggested fix:
      Consider using another name, such as
      ‘forAll’, ‘for_all’, or ‘forall_’.
  |
4 | forall f ls = and (fmap f ls)
  | ^^^^^^
```
