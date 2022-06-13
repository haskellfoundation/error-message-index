---
title: Unticked promoted constructors
summary: A promoted data constructor was used as a type without it being indicated with a tick mark.
severity: warning
flag: "-Wunticked-promoted-constructors"
extension: DataKinds
introduced: 9.6.1
---

When [using a datatype as a kind](https://downloads.haskell.org/ghc/latest/docs/html/users_guide/exts/data_kinds.html), its constructors become types. Because Haskell has separate namespaces for data constructors and type constructors, this can lead to ambiguities. These ambiguities can be resolved by prefixing the constructor's name with a tick mark (`'`). To avoid potential ambiguities in the future, the flag `-Wunticked-promoted-constructors` can require that _all_ promoted constructors have tick marks.
