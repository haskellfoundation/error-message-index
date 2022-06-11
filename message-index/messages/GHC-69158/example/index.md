---
title: Name clash due to mix of qualified and unqualified re-export
---

## Error Message

```
Greeting.hs:3:5: error: [GHC-69158]
    Conflicting exports for ‘greeting’:
       ‘W.greeting’ exports ‘W.greeting’
         imported qualified from ‘World’ at Greeting.hs:6:1-27
         (and originally defined at World.hs:4:1-8)
       ‘U.greeting’ exports ‘U.greeting’
         imported qualified from ‘Universe’ at Greeting.hs:7:1-30
         (and originally defined at Universe.hs:4:1-8)
  |
3 |   , U.greeting
  |     ^^^^^^^^^^
```

## Explanation

This examples defines the modules `World` and `Universe`, both of which export
an identifier named `greeting`. The `Greeting` module then imports `World` and
`Universe` qualified, meaning it can use both identifiers named `greeting` in
the body of `bothGreetings` without any ambiguity. However, the export of both
`greeting`s in `Greeting`'s export list does cause ambiguity, because a module
can only export one identifier with a given name.

In this case, we decide that we want to export just one default greeting, and
that most users of our code won't need to greet the entire universe. Therefore,
we fix the error by removing the re-export of `U.greeting`.

If we still want to somehow export `U.greeting` in addition to `W.greeting`,
we'll have to define a new identifier and set it equal to `U.greeting`, and then
export that instead. For example, we could define
`universalGreeting = U.greeting` in the body of `Greeting`.
