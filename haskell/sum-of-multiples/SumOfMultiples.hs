module SumOfMultiples (sumOfMultiples, sumOfMultiplesDefault) where


sumOfMultiples :: [Int] -> Int -> Int
sumOfMultiples numbers n = sum $ filter isMultiple $ take (n-1) [1..]
                        where isMultiple y = any ((== 0) . mod y) numbers


sumOfMultiplesDefault :: Int -> Int
sumOfMultiplesDefault = sumOfMultiples [3, 5]