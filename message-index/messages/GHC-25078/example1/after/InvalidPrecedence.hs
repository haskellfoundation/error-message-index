module InvalidPrecedence where

(⊚‿⊚) :: Int -> Int -> Int
(⊚‿⊚) = (+)

infixl 9 ⊚‿⊚
