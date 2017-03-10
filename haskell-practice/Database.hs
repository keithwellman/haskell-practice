module Database where

import Data.Time

data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate UTCTime
                  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase =
  [ DbDate (UTCTime
             (fromGregorian 1911 5 1)
             (secondsToDiffTime 34123))
  , DbNumber 9001
  , DbNumber 1
  , DbString "Hello, world!"
  , DbDate (UTCTime
             (fromGregorian 1921 5 1)
             (secondsToDiffTime 34123))
  ]

filterDbDate :: [DatabaseItem] -> [UTCTime]
--filterDbDate = foldr (\(DbDate a) b -> a : b)  []
filterDbDate = foldr f []
  where f (DbDate a) b = a : b
        f _ b          = b
-- filterDbDate theDatabase
-- [1911-05-01 09:28:43 UTC,1921-05-01 09:28:43 UTC]

filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber = foldr f []
  where f (DbNumber a) b = a : b
        f _ b            = b

mostRecent :: [DatabaseItem] -> UTCTime
mostRecent db = foldr max x xs
  where (x:xs) = filterDbDate db

sumDb :: [DatabaseItem] -> Integer
sumDb = foldr f 0
  where f (DbNumber a) b = a + b
        f _ b            = b
