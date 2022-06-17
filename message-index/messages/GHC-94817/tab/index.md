---
title: A file that uses a tab for indentation
---
## Message
```
Tab.hs:5:1: warning: [-Wtabs] [GHC-94817]
    Tab character found here.
    Suggested fix: Please use spaces instead.
  |
5 |         x + y
  | ^^^^^^^^
```

## Explanation

A tab character was found, which can be confusing.
The warning can be addressed by replacing the tab with spaces.
