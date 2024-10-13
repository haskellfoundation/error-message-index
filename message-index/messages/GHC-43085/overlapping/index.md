---
title: Overlapping instances for Maybe
---

Here, the two instances `Formatter (Maybe a)` and `Formatter (Maybe Int)` are overlapping.
Since the latter is more specific, we can solve this by annotating the instances with the `{-# OVERLAPPABLE #-}` and `{-# OVERLAPS #-}`.
