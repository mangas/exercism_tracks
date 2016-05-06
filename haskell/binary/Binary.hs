module Binary (toDecimal) where
    
import Data.Char
    
toDecimal :: String -> Int
toDecimal str = case filter (not . isDigit) str of
    [] -> sum $ zipWith ((*) . (2 ^)) [0..] $ reverse $ map digitToInt str
    _ -> 0