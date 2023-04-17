---
title: Overflowed Literal
---

## Error Message
```
before/OverflowedLiterals.hs:9:12: warning: [GHC-97441] [-Woverflowed-literals]
    Literal 258 is out of the Word8 range 0..255
  |
9 |     print (258 :: Word8)
  |            ^^^

before/OverflowedLiterals.hs:14:12: warning: [GHC-97441] [-Woverflowed-literals]
    Literal 9223372036854775817 is out of the Int range -9223372036854775808..9223372036854775807
   |
14 |     print (9223372036854775817 :: Int) 
   |            ^^^^^^^^^^^^^^^^^^^

```
