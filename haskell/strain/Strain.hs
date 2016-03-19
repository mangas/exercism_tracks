module Strain (keep, discard) where

keep :: (a -> Bool) -> [a] -> [a]
keep predicate numbers = filter predicate numbers

discard :: (a -> Bool) -> [a] -> [a]
discard predicate numbers = keep (not . predicate) numbers
