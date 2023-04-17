---
title: Overflowed Literal
summary: Literal overflowing range of supported values
severity: warning
introduced: 9.6.1
flag: -Woverflowed-literals
---

Warning emitted if a literal (constant value in the source code) will overflow.
This doesn't cause error at runtime, but might cause confusion because overflowed value might be different than what you expect.

To fix the warning you can:

- Use different value for the literal so that it fits within the range supported by its type
- Use different type, which is capable of representing the value
