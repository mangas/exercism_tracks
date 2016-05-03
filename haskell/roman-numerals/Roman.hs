module Roman (numerals) where
    
import Data.List
import Data.Maybe
    
romanValues :: [(Char, Int)]
romanValues = [('M', 1000), ('D', 500), ('C', 100),
               ('L', 50), ('X', 10), ('V', 5), ('I', 1)]
               
romanSubtractors :: [(Char, Int)]
romanSubtractors = [('M', 1000), ('C', 100), ('X', 10), ('I', 1)]


numerals :: Int -> String
numerals = roman ""
    
roman :: String -> Int -> String
roman s 0 = s
roman s i 
        | combinedValue > value = roman (s ++ nLetter:[pLetter]) (i-combinedValue)
        | otherwise = roman (s ++ [letter]) (i-value)
    where
        (letter, value) = fromJust $ find (\(l, v) -> v<=i) romanValues
        (pLetter, pValue) = case dropWhile ( \(l, v) -> v<i ) $ reverse romanValues of
            (x:_) -> x
            []    -> head romanValues
        (nLetter, nValue) = fromJust $ find (\(l, v) -> pValue-v<=i) $ reverse romanSubtractors
        combinedValue = pValue - nValue