module Jammin where

data Fruit =
   Peach
 | Plum
 | Apple
 | Blackberry
 deriving (Eq, Ord, Show)

-- Record syntax which creates accessors
data JamJars =
  Jam { fruit :: Fruit
      , count :: Int }
      deriving (Eq, Ord, Show)

row1, row2, row3, row4, row5, row6 :: JamJars
row1 = Jam Peach 5
row2 = Jam Apple 3
row3 = Jam Plum 9
row4 = Jam Blackberry 30
row5 = Jam Plum 3
row6 = Jam Apple 18

allJam :: [JamJars]
allJam = [row1, row2, row3, row4, row5, row6]

totalJars :: [JamJars] -> Int
totalJars rows = sum [count n | n <- rows]

largestRow :: [JamJars] -> JamJars
largestRow rows = undefined
