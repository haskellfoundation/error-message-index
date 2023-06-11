---
title: Expression syntax in pattern
summary: There has been an attempt to pattern match on expression syntax. 
severity: error
introduced: 9.6.1
---

Pattern matching allows constructors and literals to be used to take apart values, exposing their contents. The syntax of patterns is very similar to that of the expressions that create values, but many constructs that are allowed in expression contexts are not meaningful patterns. 

## Example Text

```   
Expression syntax in pattern: [1 .. 10]
```

