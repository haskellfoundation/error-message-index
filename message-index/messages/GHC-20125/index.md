---
title: Missing field(s)
summary: Initialization of record with missing field(s).
severity: warning
introduced: 9.6.1
flag: -Wmissing-fields
---
When constructing a record using labeled fields, all fields which are not explicitly stated are implicitly initialized with a bottom term. This means that accessing the field results in a panic.

If a *strict* field is missing, the error [GHC-95909](/messages/GHC-95909/index.html) is emitted instead.