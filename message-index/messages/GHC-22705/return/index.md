---
title: Non-canonical 'return' defined
---

In this example, 'return' is defined in terms of 'P', which doesn't directly use Applicative's 'pure'.

To fix this, you can define 'return' as 'pure', or leave the definition empty, to use the default value.
