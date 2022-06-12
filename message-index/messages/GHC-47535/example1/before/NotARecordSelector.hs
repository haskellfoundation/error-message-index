module NotARecordSelector where

newtype Bar = Bar { bar :: Int }

foo :: Bar -> Bar
foo x = x { foo = 1 }
