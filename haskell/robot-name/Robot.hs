module Robot (robotName, mkRobot, resetName) where

import System.Random
import Data.Char
import Data.IORef

robotName :: IORef String -> IO String
robotName = readIORef

mkRobot :: IO (IORef String)
mkRobot = do
        name <- genName
        newIORef name

resetName :: IORef String -> IO ()
resetName n = do
        name <- robotName n
        new <- genName
        if name == new
        then resetName n
        else writeIORef n new

genName :: IO String
genName = do
    g <- newStdGen
    return $ chars g ++ map intToDigit (numbers g)
    where
        chars g = take 2 $ randomRs ('A','Z') g
        numbers g = take 3 $ randomRs (1,9) g
