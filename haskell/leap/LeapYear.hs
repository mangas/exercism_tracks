module LeapYear (isLeapYear) where

isLeapYear :: Int -> Bool
isLeapYear year
            | mod year 4 /= 0 = False
            | mod year 100 /= 0 = True
            | mod year 400 == 0 = True
            | otherwise = False