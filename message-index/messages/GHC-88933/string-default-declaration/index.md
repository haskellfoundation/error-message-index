---
title: A default declaration was provided for String
order: 2
---

In this example, the programmer wrote a default declaration for the type `String`, which does not implement the type class `Num`.
If we enable the `OverloadedStrings` extension, then the rules about which types are allowed in default declarations are relaxed.
Every type which implements either the `Num` or the `IsString` type class is now allowed in default declarations.

# Error message


```
StringDefaultDeclaration.hs:4:1: error: [GHC-88933]
    • The default type ‘String’ is not an instance of ‘Num’
    • When checking the types in a default declaration
  |
4 | default (String)

```
