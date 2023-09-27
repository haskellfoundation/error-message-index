---
title: Non-numeric type in default declaration
summary: Default declarations may only mention types which implement the Num type class
severity: error
introduced: 9.6.1
---

A numeric literal such as `5` is overloaded in Haskell and has the type `forall a. Num a => a`.
This allows the programmer to use numeric literals in many contexts without having a separate literal syntax for different numeric types.
By extension, many numeric functions have a polymorphic type involving the `Num` type class.

A downside of using overloaded arithmetic expressions is that GHC is not always able to non-ambiguously infer a concrete type, such as `Int` or `Double`.
This is the case, for example, in the expression `show 5`.
The compiler cannot infer if the programmer means `show (5 :: Int)`, `show (5 :: Double)` or any other numeric type.

Since this case is very common, the Haskell report specifies a default behaviour for overloaded numeric expressions which involve the `Num` typeclass.
Numeric types are defaulted to `Integer`, and if that is not possible to `Double`.

This defaulting behaviour can be customized with "default declarations".
A default declaration uses the syntax `default (...)` with a list of comma-separated types.
These types are tried in the order in which they occur in the default declaration.

Every type which appears in a default declaration must implement the `Num` type class.
If a type which occurs in a default declaration does not have such an instance, then this error
is thrown by GHC.
