---
title: Unused "do" bind
summary: A return value of a monadic action is ignored
severity: warning
flag: -Wunused-do-bind
introduced: 9.6.1.
---

Many monadic actions perform side effects before returning a value. For example,
`sequence :: (Traversable t, Monad m) => t (m a) -> m (t a)` performs all
actions in a traversable container and returns the container with the return
values. Sometimes, we are only interested in the side effect of a monadic
actions, and not the return value. In these cases, we should use appropriate
functions indicating that we purposefully ignore the return value.
