---
title: Missing Export List
summary: The module export list is missing
severity: warning
flag: -Wmissing-export-lists
introduced: 9.6.1
---

If enabled by `-Wmissing-export-lists` or `-Weverything`, GHC issues a warning when the `module` declaration does not contain an export list. When an export list is missing, all definitions in the module are exported.
