main = return ()

enumFromToThis :: Int -> Int -> [Int]
enumFromToThis x y =
  if (x > y)
    then []
    else x : enumFromToThis (x + 1) y

x .-. y = enumFromToThis x y

data Option a = Some a | None deriving (Show)

data Result e a = Error e | Ok a deriving (Show)

safeDiv :: Double -> Double -> Result String Double
safeDiv x y =
  if (y == 0)
    then Error "Not div by zero"
    else Ok (x / y)

option :: a -> Option a -> a
option def None = def
option _ (Some x) = x


allEven :: [Int] -> Bool
allEven [] = True
allEven (x:xs) = x `mod` 2 == 0 && allEven xs

allP :: [Bool] -> Bool
allP [] = True
allP (x:xs) = x && allP xs
-- checks if all values are true

allEven' :: [Int] -> Bool
allEven' xs = allP (map (\x -> x `mod` 2 == 0) xs)

allP' :: (a -> Bool) -> [a] -> Bool
allP' p [] = True
allP' p (x:xs) = p x && allP' p xs

allEven'' :: [Int] -> Bool
allEven'' xs = allP' (\x -> x `mod` 2 == 0) xs

allEvenF :: [Int] -> Bool
allEvenF xs = (foldl ((+) `mod` 2) 0 xs) `mod` 2 == 0
-- no



-- foldl takes a binary operator, starting position, and list
