---
title: <insert a title for this example here>
---

Typos in pragma names leads to warnings being emitted. Fixing the typos makes the warnings go away.

## Error Message
```
UnrecognisedPragmas.hs:1:1: warning: [GHC-42044] [-Wunrecognised-pragmas]
    Unrecognised pragma: LANGUGE
    Suggested fix: Perhaps you meant ‘LANGUAGE’
  |
1 | {-# LANGUGE BangPatterns #-}
  | ^^^^^^^^^^^

UnrecognisedPragmas.hs:3:1: warning: [GHC-42044] [-Wunrecognised-pragmas]
    Unrecognised pragma: OPTION_HUGS
    Suggested fix: Perhaps you meant ‘OPTIONS_HUGS’
  |
3 | {-# OPTION_HUGS #-}
  | ^^^^^^^^^^^^^^^

UnrecognisedPragmas.hs:9:1: warning: [GHC-42044] [-Wunrecognised-pragmas]
    Unrecognised pragma: INLNE
    Suggested fix: Perhaps you meant ‘INLINE’
  |
9 | {-# INLNE x #-}
  | ^^^^^^^^^
```
