---
title: No explicit import list
summary: Items brought into scope are not listed explicitly.
severity: warning
flag: "-Wmissing-import-lists"
introduced: 9.6.1
---

If an import statement brings identifiers into scope, but those identifiers are not explicitly listed, then they might become ambiguous in the future.
