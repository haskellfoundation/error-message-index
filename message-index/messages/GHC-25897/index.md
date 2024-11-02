---
title: GADT pattern match must have a known result type
summary: A pattern match on a GADT cannot succeed unless GHC knows the result type of the pattern match.
severity: error
introduced: 9.6.1
---

A pattern match on a GADT cannot succeed unless GHC knows the result
type of the pattern match. This information might, for example, be derived from a type
signature, or by type inference due to the context in which the pattern match occurs.

To solve the problem you must somehow tell GHC the type of the pattern
match.

A related situation where this error can arise is when binding a GADT constructor with
a `let` binding; see the second example.
