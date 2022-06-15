---
title: Bidirectional formatting in a comment
---
## Message
```
BiDi.hs:3:26: warning: [-Wunicode-bidirectional-format-characters] [GHC-03272]
    A unicode bidirectional formatting character (U+202E RIGHT-TO-LEFT OVERRIDE (RLO))
    was found at offset 44 in the file
    along with further bidirectional formatting characters at offset 65: U+202C POP DIRECTIONAL FORMATTING (PDF)
    Bidirectional formatting characters may be rendered misleadingly in certain editors
  |
3 | -- This comment contains ‮bidirectional format‬ chars
  |                          ^
```

## Explanation

The phrase "bidirectional formatting" is surrounded by `U+202E RIGHT-TO-LEFT OVERRIDE (RLO)` and `U+202C POP DIRECTIONAL FORMATTING (PDF)` characters in the code that causes the warning to be emitted.
In software with good support for bidirectional text, the resulting comment reads "This comment contains tamrof lanoitceridib chars".
When bidirectional layout is intended, the warning should be disabled; if bidirectional layout is not intended, the control characters should be removed.
