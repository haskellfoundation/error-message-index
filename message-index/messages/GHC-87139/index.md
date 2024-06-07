---
title: Illegal deriving strategy
summary: Use of a deriving strategy without enabling the corresponding language extension
severity: error
introduced: 9.8.1
---

This error occurs if the syntax for specifying a deriving strategy
is being used without having the corresponding language extension enabled.

The fix is usually to either enable the language extension, or to remove
the deriving strategy (if it happens to match the default).
