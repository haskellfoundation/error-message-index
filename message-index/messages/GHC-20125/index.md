---
title: Missing Fields
summary: Initialization of record with missing fields
severity: warning
introduced: 9.6.1
---
The initialization of a record is missing one or more (lazy) fields.
When constructing a record using labeled fields, all fields which are not explicitly initialized are implicitly initialized with a term bottom which will panic at runtime if the field is accessed.
