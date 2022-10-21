---
title: Redundant patterns
summary: A pattern is impossible to reach due to earlier patterns
introduced: 9.6.1
severity: warning
flag: -Woverlapping-patterns
---

In multi-equation definitions and case expressions, patterns are matched from top to bottom.
This means that earlier patterns are tested before later patterns.
If every value that a pattern could match has already been ruled out by earlier patterns, then it is unreachable, which typically indicates a bug or misunderstanding.

