module Main where

import Data.Word (Word8)

main :: IO ()
main = do
    -- Word8 can represent values in range (0,255)
    -- 258 is 3 larger than maxBound so it will wrap around 0 -> 1 -> 2
    -- prints 2 due to overflow
    print (258 :: Word8)

    -- Int can represent values in range (-9223372036854775808,9223372036854775807)
    -- 9223372036854775817 is 10 larger than maxBound so it will wrap around to negative values
    -- prints -9223372036854775799 due to overflow
    print (9223372036854775817 :: Int)
