module DNA (hammingDistance) where

hammingDistance :: String -> String -> Int
hammingDistance = (sum . ) . zipWith ((fromEnum . ) . (/=) )

