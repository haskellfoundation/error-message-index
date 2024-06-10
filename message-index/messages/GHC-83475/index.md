---
title: Unused Record Wildcard
summary: Pattern contains record wildcard that is not used
severity: warning
flag: -Wunused-record-wildcards
introduced: 9.6.1
---

If `RecordWildCards` is enabled we can automatically bind fields of a record by using patterns like `MyRecord{..}`. Not using any of the record fields that were bound using the record wildcard syntax will result in a warning.
