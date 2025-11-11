---
title: Non-canonical '>>' defined
---

In this example, '>>' is defined in terms of 'P', which doesn't directly use Applicative's '*>'.

To fix this, you can define '>>' as '*>', or leave the definition empty, to use the default value.
