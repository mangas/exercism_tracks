module LeapYear (isLeapYear) where

isLeapYear :: Int -> Bool
isLeapYear year
            | mod year 4 == 0 && mod year 100 /= 0 || mod year 400 == 0 = True
            | otherwise = False