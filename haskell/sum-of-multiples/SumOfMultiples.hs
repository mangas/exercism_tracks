module SumOfMultiples (sumOfMultiples, sumOfMultiplesDefault) where


sumOfMultiples :: [Int] -> Int -> Int
sumOfMultiples numbers n = sum $ map (sumIfMultiple numbers) $ take (n-1) [1..]


sumIfMultiple :: [Int] -> Int -> Int
sumIfMultiple numbers n
        | any (\x -> mod n x == 0) numbers = n
        | otherwise = 0


sumOfMultiplesDefault :: Int -> Int
sumOfMultiplesDefault = sumOfMultiples [3, 5]