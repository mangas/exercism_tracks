module Phone (areaCode, number, prettyPrint) where

import Data.Char
import Data.List

areaCode :: String -> String
areaCode = take 3 . number

number :: String -> String
number n
        | size == 11 && (head cleanNumber == '1') = drop 1 cleanNumber
        | size /= 10 = replicate 10 '0'
        | otherwise = cleanNumber
         where
            cleanNumber = filter isDigit n
            size = length cleanNumber



prettyPrint :: String -> String
prettyPrint n =
        let cleanNumber = number n
            prefix = "(" ++ take 3 cleanNumber ++ ") "
            fstNum = drop 3 $ take 6 cleanNumber ++ "-"
            sndNum = drop 6 cleanNumber
        in prefix ++ fstNum ++ sndNum
