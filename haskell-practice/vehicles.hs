{-# LANGUAGE FlexibleInstances #-}

module Practice where

  data Manufacturer = Mini | Mazda | Tata deriving (Show, Eq)
  data Price = Price Integer deriving (Show, Eq)
  data Airline = PapuAir | CatapultsRUs | TakeYourChanceUnited deriving (Show, Eq)
  data Vehicle = Car Manufacturer Price | Plane Airline deriving (Show, Eq)

  mycar :: Vehicle
  mycar = Car Mini (Price 14000)

  urCar :: Vehicle
  urCar = Car Mazda (Price 20000)

  clownCar :: Vehicle
  clownCar = Car Tata (Price 7000)

  doge :: Vehicle
  doge = Plane PapuAir

  isCar :: Vehicle -> Bool
  isCar (Car _ _) = True
  isCar _         = False

  isPlane :: Vehicle -> Bool
  isPlane (Plane _) = True
  isPlane _         = False

  areCars :: [Vehicle] -> [Bool]
  areCars xs = [isCar x | x <- xs]

  --data Goats = Goats Int deriving (Eq, Show)

  newtype Goats = Goats Int deriving (Eq, Show)
  newtype Cows = Cows Int deriving (Eq, Show)

  tooManyGoats :: Goats -> Bool
  tooManyGoats (Goats n) = n > 42

  class TooMany a where
    tooMany :: a -> Bool

  instance TooMany Int where
    tooMany n = n > 42

  instance TooMany Goats where
    tooMany (Goats n) = tooMany n

  instance TooMany (Int, String) where
    tooMany (a, _) = tooMany a

  instance TooMany (Int, Int) where
    tooMany (a, b) = tooMany $ a + b

  instance TooMany ((Num a, TooMany a) => (a, a)) where
    tooMany (a, b) = tooMany a
