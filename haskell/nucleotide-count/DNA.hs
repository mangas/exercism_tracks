module DNA (count, nucleotideCounts) where

import Data.Map.Strict(fromList, Map, (!), updateWithKey)
import Debug.Trace

isValid :: Char -> Bool
isValid 'A' = True
isValid 'T' = True
isValid 'C' = True
isValid 'G' = True
isValid  _ = False

emptyMap :: Map Char Int
emptyMap = fromList [ ('A',0), ('T',0), ('C', 0), ('G', 0) ]

errorMessage :: Char -> String
errorMessage c = "invalid nucleotide " ++ show c

f :: Char -> Int -> Maybe Int
f key = Just . (+1)

verify :: Char -> Char -> Bool
verify c x
        | not $ isValid x = error $ errorMessage x
        | c == x = True
        | otherwise = False

count :: Char -> String -> Int
count c dna
        | not $ isValid c = error $ errorMessage c
        | otherwise = sum $ map (fromEnum . verify c ) dna

nucleotideCounts :: String -> Map Char Int
nucleotideCounts = foldl doUpdate emptyMap

doUpdate :: Map Char Int -> Char -> Map Char Int
doUpdate count c
            | not $ isValid c = error $ errorMessage c
            | otherwise = updateWithKey f c count