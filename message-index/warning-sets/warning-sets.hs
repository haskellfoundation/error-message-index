{-
-}

import Data.List
import Data.Function
import Data.Foldable
import GHC.Driver.Flags

main :: IO ()
main = print
    [ ("-W" ++ wf, (is_def, gs))
    | w <- minusWeverythingOpts, wf <- toList (warnFlagNames w)
    , let is_def = w `elem` standardWarnings
    , let gs = [ "-W" ++ g | g <- smallestWarningGroups w ]
    ]
