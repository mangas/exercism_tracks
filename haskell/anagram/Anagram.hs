module Anagram (anagramsFor) where

import Data.Char
import qualified Data.CaseInsensitive as CI
import Data.List

anagramsFor :: String -> [String] -> [String]
anagramsFor = filter . isAnagram

isAnagram :: String -> String -> Bool
isAnagram x word
            | CI.mk x == CI.mk word = False
            | toSortedUpperString word == toSortedUpperString x = True
            | otherwise = False

toSortedUpperString :: String -> String
toSortedUpperString = sort . map toUpper