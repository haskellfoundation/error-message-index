module Main where

import Data.Word (Word8)

main :: IO ()
main = do
    -- Word8 can represent values in range (0,255)
    -- prints 2 due to overflow
    print (258 :: Word8)
    --       ^ value is 3 larger than maxBound so it will wrap around 0 -> 1 -> 2

    -- Int can represent values in range (-9223372036854775808,9223372036854775807)
    -- prints -9223372036854775799 due to overflow
    print (9223372036854775817 :: Int)
    --                      ^ value is 10 larger than maxBound
