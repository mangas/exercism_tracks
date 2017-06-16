module Raindrops (convert) where

import Data.Maybe

convert :: Int -> String
convert n = fromMaybe (show n) output
            where
                factors = [(3, "Pling"), (5, "Plang"), (7, "Plong")]
                output = mconcat $ map (\(f, str) -> if n `rem` f==0 then Just str else Nothing ) factors



