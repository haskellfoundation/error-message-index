---
title: main has wrong name
---

In this example, the `notMain` value is the intended entry point of the program,
but it is not called `main` so GHC does not find it. Renaming `notMain` to 
`main` solves the issue.
