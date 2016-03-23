module DNA (count, nucleotideCounts) where

import Data.Map.Strict(fromList, Map, (!), updateWithKey)
import Data.List

valid :: String
valid = "ATCG"

isValid :: Char -> Char
isValid c
        | elem c valid = c
        | otherwise = error $ "invalid nucleotide " ++ show c


emptyMap :: Map Char Int
emptyMap = fromList $ map (\x -> (x, 0) ) valid

f :: Char -> Int -> Maybe Int
f key = Just . (+1)

verify :: Char -> Char -> Bool
verify c x = c == isValid x

count :: Char -> String -> Int
count c dna =
        let validC = isValid c in
        sum $ map (fromEnum . verify validC ) dna

nucleotideCounts :: String -> Map Char Int
nucleotideCounts = foldl' doUpdate emptyMap

doUpdate :: Map Char Int -> Char -> Map Char Int
doUpdate count c = updateWithKey f (isValid c) count