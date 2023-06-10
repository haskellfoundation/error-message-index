---
title: Using tuple section in pattern
---

When pattern matching, tuple sections are not allowed as patterns to be matched against. In the example below, one of the components of a tuple pattern was forgotten. We can fix this by adding the wildcard _ to match on the first element of the pair. 

#  Error Message 

```
before.hs:4:6: error: [GHC-09646] Tuple section in pattern context
  |
4 | snd' (,x) = x 
  |      ^^^^
Failed, no modules loaded.
``` 
