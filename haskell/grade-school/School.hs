module School( sorted, add, empty, grade, School ) where

import qualified Data.Map.Strict as Map
import Data.List

type Names = [String]
type Grade = Int
type School = Map.Map Grade Names

empty :: School
empty = Map.empty

add :: Grade -> String -> School -> School
add grade = Map.insertWith ( (sort .) . (++) ) grade . (:[])

grade :: Grade -> School -> Names
grade = Map.findWithDefault []

sorted :: School -> [ (Grade, Names) ]
sorted = Map.toAscList

