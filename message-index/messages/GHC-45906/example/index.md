---
title: Illegal standalone kind signature
---

Module fails to compile because it contains a standalone type
signature.

## Error Message

```haskell
SAKS.hs:7:1: error: [GHC-45906]
    Illegal standalone kind signature
    Suggested fix:
      Perhaps you intended to use the ‘StandaloneKindSignatures’ extension (implied by ‘UnliftedDatatypes’)
```
