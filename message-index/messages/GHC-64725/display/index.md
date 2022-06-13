---
title: Cannot Display functions
---

## Error Message

```
Main2.hs:12:23: error: [GHC-64725]
    • Cannot display functions.
      Perhaps there are missing arguments?
    • In the expression: display myFunction
      In an equation for ‘myDisplayedFunction’:
          myDisplayedFunction = display myFunction
   |
12 | myDisplayedFunction = display myFunction
   |                       ^^^^^^^
```

## Explanation

Here, the module `SomeDisplayLibrary` stands in for a pretty-printing library,
used to produce human readable text from Haskell values. The library provides a
type class `Display` with instances for different types with a function
`display :: Display a => a -> String` to perform the conversion. In this case
the result is of type `String` but some libraries use their own data type to
structure the output.

A problem common to these libraries is that of function typed values, since
there's no general way to represent them as strings. Perhaps for _some_
functions one could simply write the mapping from inputs to outputs - if the input space is enumerable and small enough - but it becomes impractical for larger types, and unfeasible for non-enumerable types. Usually these libraries don't provide an instance for functions. In this case, the library
authors did provide an instance, but one that gives a compile time error with more information than just "`No instance for (Display (Bool -> Int))`."

Depending on context, the solution could be to follow the error message and
display the result of applying the function to enough arguments, see
`myDisplayedAppliedFunction`.

If the intention was to actually display the function when the input space is small enough (e.g. just the two `Bool` constructors), one could define a newtype for functions of type `Bool -> a` and provide a `Display` instance for it. Then, the user can call `display` with the function wrapped in this newtype, see `myDisplayedNewtypedFunction`.
