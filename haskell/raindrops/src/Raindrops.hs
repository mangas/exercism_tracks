module Raindrops (convert) where

import Data.List

convert :: Int -> String
convert n =
        if outStr == ""
            then show n
            else outStr
        where
            factors = [(3, "Pling"), (5, "Plang"), (7, "Plong")]
            output = map (\(f, str) -> if n `rem` f==0 then str else "" ) factors
            outStr = intercalate "" output



