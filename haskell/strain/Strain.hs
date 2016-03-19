module Strain (keep, discard) where

keep :: (a -> Bool) -> [a] -> [a]
keep predicate [] = []
keep predicate (x:xs)
        | predicate x = x:keep predicate xs
        | otherwise = keep predicate xs

discard :: (a -> Bool) -> [a] -> [a]
discard predicate = keep (not . predicate)
