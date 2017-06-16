module Acronym (abbreviate) where

import Data.Char
import Data.List

abbreviate :: String -> String
abbreviate xs
    | elem ':' xs = takeWhile (':' /=) xs
    | otherwise = intercalate "" $ map mapWord $ words xs

mapWord :: String -> String
mapWord word@(y:ys)
    | all isUpper word = [y]
    | elem '-' word = abbreviate $ map (\x -> if x == '-' then ' ' else x) word
    | otherwise = filter isUpper $ toUpper y:ys