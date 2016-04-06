module ETL (transform) where

import Data.List
import Data.Char
import qualified Data.Map.Strict as M

transform :: M.Map Int [String] -> M.Map String Int
transform old = M.fromList $ foldl' (++) [] $ M.mapWithKey listToTuples old

listToTuples :: Int -> [String] -> [(String, Int)]
listToTuples value = map (\x -> (map toLower x, value))