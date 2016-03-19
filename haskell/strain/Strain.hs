module Strain (keep, discard) where

keep :: (a -> Bool) -> [a] -> [a]
keep predicate = filter predicate

discard :: (a -> Bool) -> [a] -> [a]
discard predicate = keep (not . predicate) 
