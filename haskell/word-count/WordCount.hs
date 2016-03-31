module WordCount(wordCount) where

import Data.Char
import qualified Data.Text as T
import Data.Map.Strict(Map, insertWith, empty, toAscList)

wordCount :: String -> Map String Int
wordCount words
        | any isSpace words = count ( T.words $ T.pack $ filter (\x -> isAlphaNum x || isSpace x) words )
        | otherwise = count ( T.words $ T.pack $ map (\x -> if isPunctuation x then ' ' else x) words )

count :: [T.Text] -> Map String Int
count = foldr (\x y -> insertWith (+) (map toLower $ T.unpack x) 1 y) empty