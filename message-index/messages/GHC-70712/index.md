---
title: Double dots in record update
summary: Double-dot syntax is not allowed in a record update.
severity: error
introduced: 9.6.1
---

The double-dot syntax, which is part of the [`RecordWildCards`](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/record_wildcards.html) extension, is not allowed as part of a record update, whether the extension is turned on or not.
