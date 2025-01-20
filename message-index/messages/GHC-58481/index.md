---
title: Parse error on input
summary: Generic parsing error.
severity: error
introduced: 9.6.1
---

This is a generic error, indicating that GHC could not parse the code.

GHC contains many more explicit parsing errors with more verbose descriptions of the problem.
However if the error is not separately defined there, a problem with parsing is reported with error code `GHC-58481`.

There may be many different reasons why the error `GHC-58481` was emitted, ranging from incorrect syntax that requires additional language extensions, to an expression mistakenly put in the same line as another.

Below are some examples of code that generate this generic parsing error. Please be encouraged to report more or contribute via [error-message-index github](https://github.com/haskell/error-message-index).
