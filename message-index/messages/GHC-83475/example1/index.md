---
title: Pattern contains unused record wildcard
---

None of the fields bound by `Foo{..}` are used in `f`, so the pattern may be safely removed.

## Warning

```
GHC-83475/example1/before/Example1.hs:7:7: warning: [-Wunused-record-wildcards]
    No variables bound in the record wildcard match are used
      Possible fix: omit the ‘..’
  |
7 | f Foo{..} = "Hello"
  |       ^^
```
