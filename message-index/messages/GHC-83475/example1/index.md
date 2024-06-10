---
title: Pattern contains unused record wildcard
---

## Warning

```haskell
GHC-83475/example1/before/Example1.hs:7:7: warning: [-Wunused-record-wildcards]
    No variables bound in the record wildcard match are used
      Possible fix: omit the ‘..’
  |
7 | f Foo{..} = "Hello"
  |       ^^
```

## Explanation

None of the record fields that were bound by the record wildcard were used in function `f`. The record wildcard part of the pattern `..` can be omitted by changing the pattern to `Foo{}` (or by getting rid of the argument completely if it isn't used.
