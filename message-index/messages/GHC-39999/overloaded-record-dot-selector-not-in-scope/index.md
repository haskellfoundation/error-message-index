---
title: A usage of `x.foo` with the field `foo` not being in scape
---

## Error message

```
src/Main.hs:6:12: error: [GHC-39999]
    • No instance for ‘GHC.Records.HasField "foo" MyData Int’
        arising from selecting the field ‘foo’
      Perhaps you want to add ‘foo’ to the import list in the import of
      ‘DataType’ (src/Main.hs:3:1-24).
    • In the expression: x.foo
      In an equation for ‘getFoo’: getFoo x = x.foo
  |
6 | getFoo x = x.foo
  |
```

## Explanation

This error arises when using the `OverloadedRecordDot` extension.
Given a module exporting a record:

```haskell
module DataType where

data MyData = MyData { foo :: Int, bar :: String }
```

When `MyData` is imported into a module without also importing the fields, attempting to access fields using `OverloadedRecordDot` will result in an error.

Adding the field to the import list will resolve the issue.
