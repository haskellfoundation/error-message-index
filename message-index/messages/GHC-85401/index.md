---
title: Missing Export List
summary: The module export list is missing
severity: warning
flag: -Wmissing-export-lists
introduced: 9.6.1
---

GHC issues a warning if he module declaration does not contain an export list. When an export list is missing, all definitions in the module are exported.
