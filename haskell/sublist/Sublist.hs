module Sublist (Sublist(Equal, Sublist, Superlist, Unequal), sublist) where

data Sublist = Equal | Sublist | Superlist | Unequal
    deriving (Show, Eq)

sublist :: Eq a => [a] -> [a] -> Sublist
sublist a b
    | a == b = Equal
    | isSublist a b = Sublist
    | isSublist b a  = Superlist
    | otherwise = Unequal

isSublist :: Eq a => [a] -> [a] -> Bool
isSublist [] _ = True
isSublist _ [] = False
isSublist a@(x:xs) b@(y:ys)
    | length b < length a = False
    | not equals = isSublist a ys
    | otherwise = True
    where equals = and $ zipWith (==) a b

