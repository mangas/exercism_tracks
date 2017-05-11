module RunLength (decode, encode) where

import Data.Char
import Data.List

decode :: String -> String
decode [] = ""
decode encodedText = do
            let (x,xs)  = span isDigit encodedText
            if x == []
            then decodeChar x xs ++ (decode $ tail encodedText)
            else decodeChar x xs ++ (decode $ tail $ xs )

decodeChar :: String -> String -> String
decodeChar [] (x:_)  = [x]
decodeChar n (x:xs) = replicate (read n :: Int) x


encode :: String -> String
encode [] = ""
encode text@(x:xs) = do
           let (same, diff) = span ((==) x) text
           let r = if (length same) == 1
                        then same
                        else (show $ length same ) ++ [head same]
           r ++ encode diff

