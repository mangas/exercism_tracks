module Triangle (TriangleType(..), triangleType) where
   
import Data.List
   
data TriangleType = Equilateral | Isosceles | Scalene | Illogical
    deriving (Show, Eq)

triangleType :: Int -> Int -> Int -> TriangleType
triangleType s1 s2 s3 
            | any (==0) ss = Illogical
            | s1+s2<=s3 || s2+s3<=s1 || s1+s3<=s2 = Illogical 
            | length uniq == 1 = Equilateral
            | length uniq == 2 = Isosceles
            | length uniq == 3 = Scalene 
            where 
                ss = [s1, s2, s3]
                uniq = map head $ group $ sort ss