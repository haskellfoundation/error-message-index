---
title: Bidirectional formatting warning
summary: The source file contains Unicode bidirectional formatting instructions
severity: warning
introduced: 9.6.1
flag: "-Wunicode-bidirectional-format-characters"
---

This warning is emitted when a file contains one of the following Unicode characters:

| Character  | Name                                      |
|------------|-------------------------------------------|
| `'\x202a'` | `U+202A LEFT-TO-RIGHT EMBEDDING (LRE)`    |
| `'\x202b'` | `U+202B RIGHT-TO-LEFT EMBEDDING (RLE)`    |
| `'\x202c'` | `U+202C POP DIRECTIONAL FORMATTING (PDF)` |
| `'\x202d'` | `U+202D LEFT-TO-RIGHT OVERRIDE (LRO)`     |
| `'\x202e'` | `U+202E RIGHT-TO-LEFT OVERRIDE (RLO)`     |
| `'\x2066'` | `U+2066 LEFT-TO-RIGHT ISOLATE (LRI)`      |
| `'\x2067'` | `U+2067 RIGHT-TO-LEFT ISOLATE (RLI)`      |
| `'\x2068'` | `U+2068 FIRST STRONG ISOLATE (FSI)`       |
| `'\x2069'` | `U+2069 POP DIRECTIONAL ISOLATE (PDI)`    |

These characters can lead to misleading text formatting in some editors due to a lack of consistent support for Unicode bidirectional text.
