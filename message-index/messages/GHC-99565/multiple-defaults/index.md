---
title: Multiple default declarations in single module
---

In this example the programmer tries to customize the defaulting behaviour for numeric types to allow defaulting to both `Double` and `Int`.
In order to do this both defaults have to be specified in a comma-separated list instead of two separate default declarations.

# Error Message

```
messages/GHC-99565/multiple-defaults/before/MultipleDefaults.hs:4:1: error:
    Multiple default declarations
      here was another default declaration messages/GHC-99565/multiple-defaults/before/MultipleDefaults.hs:3:1-16
  |
4 | default (Double)
  | ^^^^^^^^^^^^^^^^
```
