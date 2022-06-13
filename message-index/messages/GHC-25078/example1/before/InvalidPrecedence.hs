module InvalidPrecedence where

(⊚‿⊚) :: Int -> Int -> Int
(⊚‿⊚) = (+)

infixl 1000 ⊚‿⊚
