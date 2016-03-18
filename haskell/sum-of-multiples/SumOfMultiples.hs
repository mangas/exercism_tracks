module SumOfMultiples (sumOfMultiples, sumOfMultiplesDefault) where


sumOfMultiples :: [Int] -> Int -> Int
sumOfMultiples numbers n = sum $ map (sumIfMultiple numbers) $ take (n-1) [1..]


sumIfMultiple :: [Int] -> Int -> Int
sumIfMultiple numbers n
        | filter (\x -> mod n x == 0) numbers == [] = 0
        | otherwise = n


sumOfMultiplesDefault :: Int -> Int
sumOfMultiplesDefault = sumOfMultiples [3, 5]