---
title: Overflowed Literals
summary: Literal overflowing range of supported values
severity: warning
introduced: 9.6.1
flag: -Woverflowed-literals
---

This warning is emitted if an integer literal (that is, a constant integer value in the source code) will overflow.

Many integer types have fixed precision. This means that only a certain number of bits are available to represent their values.
You can check the minimum / maximum values representable by given type by using `minBound` / `maxBound` from [Bounded](https://hackage.haskell.org/package/base-4.18.0.0/docs/Prelude.html#t:Bounded) typeclass defined in the `base` package. The range of supported values might differ based on what OS / platform you’re using.

```haskell
>>> minBound :: Int
-9223372036854775808
>>> maxBound :: Int
9223372036854775807
```

Calculations that exceed this range cause the value to wrap around, which is called "overflow" or "underflow". Literals outside the range also overflow. This doesn't cause error at runtime, but might cause confusion because overflowed value is usually not what you want or expect.

To fix the warning you can:

- Use a different value for the literal so that it fits within the range supported by its type
- Use a type that is capable of representing the value (or `Integer`, which can represent values as big as your computer's memory)
