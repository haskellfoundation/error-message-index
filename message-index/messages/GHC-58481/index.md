---
title: Parse error on input
summary: Generic parsing error.
severity: error
introduced: 9.6.1
---

This is a generic error, indicating that GHC could not parse the code. 

GHC contains many more explicit parsing errors with more verbose descriptions of the problem. However if the error is not separately defined there, a problem with parsing is reported with error code 58481.

There may be many different reasons why error 58481 was given, ranging from an incorrect syntax that needs additional Haskell Language Extensions, to a expression mistakenly put in the same line as other.

Below are some examples of code that generate this generic parsing error. Please be encouraged to report more or contribute via [error-messages github](https://github.com/haskell/error-messages).