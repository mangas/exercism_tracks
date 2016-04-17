module Meetup(Weekday(..), Schedule(..), meetupDay ) where

import Data.Time.Calendar
import qualified Data.Dates as D
import Debug.Trace

data Weekday = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
    deriving (Show, Enum, Ord, Eq)
data Schedule = First | Second | Third | Fourth | Last | Teenth 
    deriving (Show, Enum, Ord, Eq)

meetupDay :: Schedule -> Weekday -> Integer -> Int -> Day
meetupDay schedule wDay year month = 
    let count = getCount schedule
    in findDay schedule wDay count $ firstDay year month schedule
          
          
findDay :: Schedule -> Weekday -> Int -> Day -> Day
findDay _ _ 0 day = day
findDay schedule weekDay count day =  findDay schedule weekDay nextCount nDay
                            where 
                                foundWeekDay = verifyDay weekDay tWeekday
                                nDay = nextDay schedule count foundWeekDay day
                                nextCount = if foundWeekDay then count -1 else count
                                tWeekday = D.dateWeekDay $ D.dayToDateTime day
                                
verifyDay :: Weekday -> D.WeekDay -> Bool
verifyDay day wday = fromEnum day == D.weekdayNumber wday - 1

nextDay :: Schedule -> Int -> Bool -> Day -> Day
nextDay _ 1 True day = day
nextDay schedule _ found day = getStrategy schedule found day

getCount :: Schedule -> Int
getCount First = 1
getCount Second = 2
getCount Third = 3
getCount Fourth = 4
getCount Last = 1
getCount Teenth = 1

getStrategy :: Schedule -> Bool -> (Day -> Day)
getStrategy First _ = addDays 1
getStrategy Last _ = addDays (-1)
getStrategy Teenth _ = addDays 1
getStrategy _ False = addDays 1
getStrategy _ True = addDays 7


firstDay :: Integer -> Int -> Schedule -> Day
firstDay year month Teenth = fromGregorian year month 13
firstDay year month Last = fromGregorian year month $ gregorianMonthLength year month                      
firstDay year month _ = fromGregorian year month 1

getDate :: Integer -> Int -> Day
getDate y m = fromGregorian y m 1