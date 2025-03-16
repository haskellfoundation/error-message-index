module QQ (qq) where

import Language.Haskell.TH.Quote
import Language.Haskell.TH

qq :: QuasiQuoter
qq = QuasiQuoter
  { quoteExp = pure . LitE . StringL
  , quoteDec = undefined
  , quotePat = undefined
  , quoteType = undefined
  }
