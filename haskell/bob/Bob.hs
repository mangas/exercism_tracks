module Bob (responseFor) where

import Data.Char

responseFor :: String -> String
responseFor message
        | all isSpace message = "Fine. Be that way!"
        | isYell message = "Whoa, chill out!"
        | last message == '?' = "Sure."
        | otherwise = "Whatever."

isYell :: String -> Bool
isYell message
        | filter (isAlpha) message == [] = False
        | all isUpper $ filter isAlpha message = True
        | otherwise = False