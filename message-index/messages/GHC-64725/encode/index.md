---
title: Cannot encode arbitrary precision integers
---

## Error Message

```
Main1.hs:9:18: error: [GHC-64725]
    • Cannot encode arbitrary precision integers.
      Consider using a fixed size representation.
    • In the expression: encode myValue
      In an equation for ‘myEncodedValue’:
          myEncodedValue = encode myValue
  |
9 | myEncodedValue = encode myValue
  |                  ^^^^^^
```

## Explanation

Here, the module `SomeEncodingLibrary` stands in for a library used to encode
Haskell values into some encoding, represented by the data type `Encoded`. The
library also provides a type class `Encode` with instances for different types,
and the function `encode :: Encode a => a -> Encoded` to perform the encoding.

There are many such Haskell libraries depending on the target encoding.
It's also common to find data types that don't work for a particular encoding;
in this example, the encoding library only works with types where the size of
values is statically-known. Since, in this case, we know `myValue` fits in an
`Int`, the solution is to use that as the type of `myValue` instead of
`Integer`. However, for a program that needs to work with `Integer`s, a
different solution would be needed, likely using a different encoding
(and encoding library) altogether.
