module Greeting
  ( W.greeting
  , U.greeting
  ) where

import qualified World as W
import qualified Universe as U

bothGreetings :: String
bothGreetings = unlines [W.greeting, U.greeting]
