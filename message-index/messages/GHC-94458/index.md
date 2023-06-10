---
title: Illegal position of Haddock comment
summary: A Haddock comment appears in an illegal position
severity: warning
flag: -Winvalid-haddock
introduced: 9.6.1
---

Haddock comments are used to document entities of Haskell programs, and are used to generate API documentation which can be displayed on Hackage or as tooltips in editors. This error is emitted when a Haddock comment is attached to an entity that cannot be documented this way. A normal comment should be used instead.
