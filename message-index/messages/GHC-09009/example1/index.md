---
title: Type roles should be one of representational, nominal, or phantom.
---

Type role annotations should be one of `representational`, `nominal`, or `phantom`. Fortunately as the choices are limited, GHC is smart enough to suggest which role you intended if a mistake is made.

## Error Message
```
IllegalRole.hs:5:13: error:
    Illegal role name ‘pantom’
    Perhaps you meant ‘phantom’
  |
5 | type role A pantom
  |             ^^^^^^
```
