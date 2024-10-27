---
title: Use of pattern synonyms without enabled language extension
---

In this example the user declared a pattern synonym without enabling the `PatternSynonym` extension, which leads to this generic parsing error.

```
messages/GHC-58481/example4/before/Pattern.hs:3:16: error: [GHC-58481]
    parse error on input ‘<-’
    Suggested fix: Possibly caused by a missing 'do'?
  |
3 | pattern Head x <- x:xs
  |                ^^
```
