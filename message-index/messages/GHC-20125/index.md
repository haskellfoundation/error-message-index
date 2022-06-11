---
title: Missing Fields
summary: Initialization of record with missing fields
severity: warning
introduced: 9.6.1
---
When constructing a record using labeled fields, all fields which are not explicitly stated are implicitly initialized with a bottom term. This means that accessing the field results in a panic.
