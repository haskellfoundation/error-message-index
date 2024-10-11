---
title: Unused "do" bind
summary: A return value of a monadic action is ignored
severity: warning
flag: -Wunused-do-bind
introduced: 9.6.1.
---

Many monadic actions perform side effects before returning a value.

Sometimes, we are only interested in the side effect of a monadic action, and
not in the return value. In these cases, we should use appropriate functions
indicating that we purposefully ignore the return value.

Even more, in monadic code without side effects such as the list monad, this
warning may indicate a bug.
