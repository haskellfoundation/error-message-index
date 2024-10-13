---
title: Wrong do bind
summary: Returning a monadic computation in a do block and not binding it will not run it
severity: warning
introduced: 9.4.1
---
When using a monadic computation in a do block one should either run it 
directly or bind the result of the computation to a variable. If neither 
is done the monadic computation is never run and can be removed.
