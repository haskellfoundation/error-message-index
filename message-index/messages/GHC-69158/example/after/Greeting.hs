module Greeting
  ( W.greeting
  ) where

import qualified World as W
import qualified Universe as U

bothGreetings :: String
bothGreetings = unlines [W.greeting, U.greeting]
