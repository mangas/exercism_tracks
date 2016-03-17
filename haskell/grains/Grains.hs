module Grains (square, total) where

total :: Integer
total = sum $ map square [1..64]

square :: Int -> Integer
square x = 2^(x-1)