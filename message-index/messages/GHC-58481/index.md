---
title: Parse error on input
summary: Generic parsing error.
severity: error
introduced: 9.6.1
---

This is a generic error, indicating that GHC could not parse the input code. 

The GHC errors suite contains many more explicit parsing errors with more verbose desription of the problem. If the error is not separately defined there, a problem with parsing is reported with number 58481.

There may be many different reasons why error 58481 was given, ranging from an incorrect syntax that needs additional Haskell Language Extensions, to a expression mistakenly put in the same line as other.

Below are example of code that generates this error. Please be encouraged to report more or contribute via [error-messages github](https://github.com/haskell/error-messages).