module Grains (square, total) where

total :: Integer
total = sum $ map square [1..64]

square :: Int -> Integer
square 1 = 1
square 2 = 2
square x = foldl (\x y -> x*2) 1 $ take (x-1) [1..]