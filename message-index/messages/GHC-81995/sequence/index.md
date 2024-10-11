---
title: Fix warning about unused "do" bind using `sequence_`
---

For example, `sequence :: (Traversable t, Monad m) => t (m a) -> m (t a)`
performs all actions in a traversable container and returns the container with
the return values. In a similar manner, `sequence_` performs all actions but
indicates that the we want to ignore the return value.

# Error message
```
sequence/before/GetLine.hs:5:3: warning: [GHC-81995] [-Wunused-do-bind]
    A do-notation statement discarded a result of type ‘[()]’
    Suggested fix:
      Suppress this warning by saying
        ‘_ <- sequence [putStrLn "First line", putStrLn "Second line"]’
  |
5 |   sequence [putStrLn "First line", putStrLn "Second line"]
  |   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
```
