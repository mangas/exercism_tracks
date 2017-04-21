module Pangram (isPangram) where
import Data.Char

isPangram :: String -> Bool
isPangram text = all (\c -> elem c $ map (toLower) text) ['a'..'z']
