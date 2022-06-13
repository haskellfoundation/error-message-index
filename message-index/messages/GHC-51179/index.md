---
title: Missing LambdaCase
summary:  Missing LambdaCase language extension
severity: error
introduced: 9.6.1
extension: LambdaCase
---

The [Lambda Case extension](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/lambda_case.html)
enables a syntactic sugar for a lambda function that pattern matches its argument immediately.
Using `LambdaCase`,
```
\case {"1" -> 1, "2" -> 2}
```
is equivalent to
```
\x -> case x of {"1" -> 1; "2" -> 2}
```

When the extension is missing, the expression is interpreted as a regular lambda expression that is incorrectly formatted.