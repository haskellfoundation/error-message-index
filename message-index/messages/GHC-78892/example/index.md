---
title: Using let ... in ... syntax in pattern.  
---

When pattern matching, let expressions are not allowed as patterns to be matched against. The logic encapsulated here should either be lifted to outside of the function, or moved inside of the function itself. 

#  Error Message 

```
Example.hs:5:6: error: [GHC-78892]
    (let ... in ...)-syntax in pattern
  |
5 | f n (let exp = x^2 in exp n) = True 
  |      ^^^^^^^^^^^^^^^^^^^^^^
```

#  Intermediate fix step 
In the below example, it is worth noting that you may first have considered refactoring to something along the lines of 
```
sq :: Int -> Int 
sq x = x^2 

f :: Int -> Int -> Bool 
f n (sq n) = True
f n _ = False 

``` 

The above code would throw a parse error in the pattern [GHC-07626](https://errors.haskell.org/messages/GHC-07626/).  
