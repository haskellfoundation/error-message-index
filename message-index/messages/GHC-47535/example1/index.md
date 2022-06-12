---
title: Identifier is not a record selector
---

The identifier `foo` is used as a record selector, but it refers to a function of the `Foo` class instead.
Using `bar` fixes the error, since it is a selector of the `Bar` record.

## Error Message
```
NotARecordSelector.hs:9:20: error: [GHC-47535]
    • ‘foo’ is not a record selector
    • In the expression: undefined {foo = ()}
      In an equation for ‘test’: test = undefined {foo = ()}
  |
9 | test = undefined { foo = () }
  |                    ^^^
```
