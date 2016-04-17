module Robot (robotName, mkRobot, resetName) where

import System.Random
import Data.IORef

robotName :: IORef String -> IO String
robotName = readIORef

mkRobot :: IO (IORef String)
mkRobot = newIORef =<< genName

resetName :: IORef String -> IO ()
resetName n = do
        name <- robotName n
        new <- genName
        if name == new
        then resetName n
        else writeIORef n new

genName :: IO String
genName = mapM randomRIO [a, a, d, d, d]
            where a = ('A', 'Z') -- a = Upper case letters
                  d = ('0', '9') -- d = Digits