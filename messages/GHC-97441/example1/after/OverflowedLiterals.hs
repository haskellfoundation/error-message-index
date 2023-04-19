module Main where

import Data.Word (Word8)

main :: IO ()
main = do
    -- Word8 can represent values in range (0,255)
    -- prints 255
    print (255 :: Word8)

    -- Int can represent values in range (-9223372036854775808,9223372036854775807)
    -- prints 9223372036854775807
    print (9223372036854775807 :: Int)
