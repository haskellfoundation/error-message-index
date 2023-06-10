---
title: A usage of `+` on a too polymorphic variable.
---

## Error message

```
Main.hs:2:11: error: [GHC-39999]
    • No instance for (Num a) arising from a use of ‘+’
      Possible fix:
        add (Num a) to the context of
          the type signature for:
            add :: forall a. a -> a -> a
    • In the expression: x + y
      In an equation for ‘add’: add x y = x + y
  |
2 | add x y = x + y
  |           ^
```

## Explanation

The operator `+` is only defined on types which have an instance of the `Num` type class. If the function has the signature `a -> a -> a` someone could e.g. pass in a `String` for `a` and GHC wouldn‘t know how to add two Strings. Too fix it, like the compiler suggests, we add the `Num a =>` constraint to the type signature to make sure that all users of `add` provide a suitable `Num` instance.
