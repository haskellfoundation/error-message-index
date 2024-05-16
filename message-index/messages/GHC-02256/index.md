---
title: Ambiguous record update
summary: Record update with duplicate field names is ambiguous
severity: warning
flag: -Wambiguous-fields
introduced: 9.6.1
---

With the `DuplicateRecordFields` extension enabled it is possible to use the same field name in multiple records within the same module.
This can lead to problems when using field accessors to access a field of a record.
