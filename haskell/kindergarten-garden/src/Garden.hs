module Garden
    ( Plant (..)
    , defaultGarden
    , garden
    , lookupPlants
    ) where

import Data.Map hiding (map)
import Data.List

data Plant = Clover
           | Grass
           | Radishes
           | Violets
           deriving (Eq, Show)

students :: [String]
students = ["Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry"]

charToPlant :: Char -> Plant
charToPlant 'C' = Clover
charToPlant 'G' = Grass
charToPlant 'R' = Radishes
charToPlant 'V' = Violets

defaultGarden :: String -> Map String [Plant]
defaultGarden = garden students

garden :: [String] -> String -> Map String [Plant]
garden students plants = fromList
                            . map ((\(k:ks, v) -> (k, v)) . unzip)
                            . groupBy (\(x,_) (y,_) -> x == y)
                            . sortOn fst
                            . concatMap (zip (concatMap (replicate 2) (sort students)) . map charToPlant)
                            $ lines plants

lookupPlants :: String -> Map String [Plant] -> [Plant]
lookupPlants student garden = garden ! student
