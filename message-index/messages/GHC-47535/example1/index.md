---
title: Identifier is a top-level binding, not a record selector
---

The identifier `foo` is used as a record selector, but is never declared as such.
Using `bar` fixes the error, since it is declared as a selector of the `Bar` record.

## Error Message
```
NotARecordSelector.hs:6:13: error: [GHC-47535]
    • ‘foo’ is not a record selector
    • In the expression: x {foo = 1}
      In an equation for ‘foo’: foo x = x {foo = 1}
  |
6 | foo x = x { foo = 1 }
  |             ^^^
```
