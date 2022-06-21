---
title: Nested forall in a foreign function type
---
## Message

```
NestedForall.hs:4:1: error: [GHC-92994]
    • Unacceptable result type in foreign declaration:
        Unexpected nested forall
    • When checking declaration:
        foreign import capi safe "foo.h fun" fun
          :: Int -> (forall a. a -> a)
  |
4 | foreign import capi "foo.h fun" fun :: Int -> (forall a . a -> a)
  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
```

## Explanation

This type contains a `forall` that does not scope over the entire type signature, which is not allowed in the FFI.
