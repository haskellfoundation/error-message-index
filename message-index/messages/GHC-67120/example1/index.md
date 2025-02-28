---
title: Missing module header
---

In this example, the file `Lib.hs` is intended to contain a module called `Lib`
which is not supposed to be the main module. However, the file is missing a
module header, so GHC defaults to the module name `Main` and expects the `main`
function. Adding an explicit module header with the name `Lib` solves this
issue.
