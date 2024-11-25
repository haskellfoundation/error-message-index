---
title: Incomplete record selector application
summary: A record selector application may not be successful
severity: warning
flag: -Wincomplete-record-selectors
introduced: 9.10.1
---

This warning is triggered when GHC is not certain whether a record selector
application will be successful. This happens when a record selector is not
defined for all constructors of a data type (a.k.a. partial record field
selector) and it is applied to a value whose data constructor can't be proved by
GHC to be one for which the selector is defined.
