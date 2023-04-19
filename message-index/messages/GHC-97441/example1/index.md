---
title: Overflowed Literals
---

## Error Message
```
OverflowedLiterals.hs:10:12: warning: [GHC-97441] [-Woverflowed-literals]
    Literal 258 is out of the Word8 range 0..255
   |
10 |     print (258 :: Word8)
   |            ^^^

OverflowedLiterals.hs:15:12: warning: [GHC-97441] [-Woverflowed-literals]
    Literal 9223372036854775817 is out of the Int range -9223372036854775808..9223372036854775807
   |
15 |     print (9223372036854775817 :: Int)
   |            ^^^^^^^^^^^^^^^^^^^
```
