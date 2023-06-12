---
title: let-syntax in pattern
summary: An attempt has been made to use a let expression whilst pattern matching. 
severity: error
introduced: 9.6.1
---

Pattern matching allows constructors and literals to be used to take apart values, exposing their contents. Even though patterns resemble expressions, they are not evaluated. The `let ... in ...` syntax is used to introduce declarations that are scoped to an expression, which doesn't make sense as a pattern without evaluation. See [GHC-04584](https://errors.haskell.org/messages/GHC-78892/) for more information on why expressions aren't permitted in pattern matching. 

## Example Text 
``` 
(let ... in ...)-syntax in pattern
```  
