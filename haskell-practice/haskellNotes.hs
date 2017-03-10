import Data.List
import System.IO

-- input / output
main = do
  putStrLn "What's your name"
  name <- getLine
  putStrln ("Hello " ++ name)

  -- Compile from command line:
  -- ghc --make name_of_file

-- start a prelude session locally
-- Terminal: stack ghci
-- :q for quit
-- :t for type ex: :t addMe (returns type definition of that function)
-- :l filename.hs to load the filter
-- :i for info
-- :m for module
--

-- compile and run
-- Terminal:
-- ghc --make filename
-- :l filename
-- :r (run)



-- Built in math funts --

piVal = pi
ePow9 = exp 9
logOf9 = log 9
squared9 = 9 ** 2
truncateVal = truncate 9.999
roundVal = round 9.999
ceilingVal = ceiling 9.999
floorVal = floor 9.999

-- also sin, cos, tan, asin, aton, acos, sinh,
-- tanh, cosh, asinh, atanh, acosh

trueAndFalse = True && False
trueOrFalse = True || False
notTrue = not(True)


something :: (Integer a, Double b) => a -> b


-- lists

primeNumbers = [3,5,7,11]
morePrimes = primeNumbers ++ [13,17,19,23,29]

-- !!!!! combines numbers into lists !!!!!
favNums = 2 : 7 : 21 : 66 :[]


multiList = [[3,5,7],[11,13,17]]

-- cons operator ??? WHAT IS THIS DOING?
morePrimes2 = 2 : morePrimes

lenPrime = length morePrimes2

revPrime = reverse morePrimes2

isListEmpty = null morePrimes2

-- get second item in the list (fist is zero)
secondPrime = morePrimes2 !! 1

firstPrime = head morePrimes2

lastPrime = last morePrimes2

primeInit = init morePrimes2

first3Primes = take 3 morePrimes2

removedPrimes = drop 3 morePrimes2

is7InList = 7 `elem` morePrimes2

maxPrime = maximum morePrimes2

minPrime = minimum morePrimes2

newList = [2,3,5]

-- what they can all evenly divide by
prodPrimes = product newList

zeroToTen = [0..10]

evenList = [2,4..20]

letterList = ['A','C'..'Z']

-- infinite list : lazy - only generates what's needed
infinPow10 = [10,20..]

many2s = take 10 (repeat 2)
-- this returns: [2,2,2,2,2,2,2,2,2,2]

many3s = replicate 10 3
-- returns: [3,3,3,3,3,3,3,3,3,3]

cycleList = take 10 (cycle [1,2,3,4,5])
-- returns: [1,2,3,4,5,1,2,3,4,5]

listTimes2 = [x * 2 | x <- [1..10]]
-- returns [2,4,6,8,10,12,14,16,18,20]

listTimes3 = [x * 3 | x <- [1..10], x * 3 <= 50]
-- returns [2,4,6,8,10,12,14,16,18,20]

-- get only the ones divisiby by 13 and 9
divisBy9N13 = [x | x <- [1..500], x `mod` 13 == 0, x `mod` 9 == 0]
-- returns: [117,234,351,468]

sortedList = sort [9,1,8,3]

sumOfLists = zipWidth (+) [1,2,3,4,5][6,7,8,9,10]

listBiggerThan5 = filter (>5) morePrimes

-- example of lazy
evensUpTo20 = takeWhile (<= 20) [2,4..]
-- returns [2,4,6,8,10,12,14,16,18,20]

-- fold left does operation from left to right
multOfList = foldl (*) 1 [2,3,4,5]

-- what!! super awesome
pow3List = [3^n | n <- [1..10]]

-- FIND OUT HOW THIS WORKS
multTable = [[x * y | y <- [1..10]] | x <- [1..10]]

-- tuples :: list of multiple datatypes
randTuple = (1, "Random Tuple")

bobSmith = ("Bob Smith", 52)

bobsName = fst bobSmith

bobsAge = snd bobSmith

names = ["Bob", "Mary", "Tom"]
addressess = ["123 Main", "234 North", "567 South"]

namesNAddress = zip names addressess
-- returns: [("Bob", "123 Main"), ("Mary", "234 North"), ("Tom", "567 South")]

-- Type Declaration
sqrt :: Floating a => a -> a

addMe :: Int -> Int -> Int
-- funcName param1 param2 = operations (returned value)
addMe x y = x + y

-- with no type declaration
sumMe x y = x + y

addTuples :: (Int, Int) -> (Int, Int) -> (Int, Int)
addTuples (x, y) (x2, y2) = (x + x2, y + y2)


whatAge :: Int -> String
whatAge 16 = "You can drive"
whatAge 18 = "You can vote"
whatAge 20 = "You're an adult"
whatAge x = "Nothing important"
whatAge _ = "Nothing important"


-- recursion

factorial :: Int -> Int

factorial 0 = 1
factorial n = n * factorial (n - 1)

-- pass in 3
-- 3 * factorial(2)
-- 2 * factorial(1)
-- 1 * factorial(0) : 1  NOTE the : sign is "equivilent to"
-- so factorial(1) = 1
-- 2 * 1 = 2
-- factorial(2) = 2
-- 3 * factorial(2) = 3 * 2 = 6

prodFact n = product [1..n]

isOdd :: Int -> Bool

isOdd n
    | n `mod` 2 == 0 = False
    | otherwise = True

isEven n = n `mod` 2 == 0

whatGrade :: Int -> String

-- NOTE that the | symbol means "guard"
whatGrade age
    | (age >= 5) && (age <= 6) = "Kindergarten"
    | (age > 6) && (age <= 10) = "Elementary School"
    | (age > 10) && (age <= 14) = "Middle School"
    | (age > 14) && (age <= 18) = "High School"
    | otherwise = "Go to college"


batAvgRating :: Double -> Double -> String

batAvgRating hits atBats
    | avg <= 0.200 = "Terrible Batting Average"
    | avg <= 0.250 = "Average Player"
    | avg <= 0.280 = "You're doing pretty good"
    | otherwise = "You're a superstar"
    where avg = hits / atBats

-- batAvgRating 20 10 returns "Terrible Batting Average"

getListItems :: [Int] -> String

getListItems [] = "Your list is empty"
getListItems (x:[]) = "Your list starts with " ++ show x
getListItems (x:y:[]) = "Your list contains " ++ show x ++ " and " ++ show y
getListItems (x:xs) = "The 1st item is " ++ show x ++ " and the rest are " ++ show xs

getFirstItem :: String -> String
getFirstItem [] = "Empty String"
getFirstItem all@(x:xs) = "The first letter in " ++ all ++ " is " ++ [x]


-- higher order functions

times4 :: Integer -> Integer
times4 x = x * 4

listTimes4 = map times4 [1,2,3,4,5]

multBy4 :: [Int] -> [Int]
multBy4 [] = []
multBy4 (x:xs) = times4 x : multBy4 xs
-- this takes the first list item and appies times4 function to x and then call
-- multBy4 with the rest of the list (recursion!!)

-- even better way to apply the times4 function to each item:
multBy4 xs = map times4 xs

areStringsEq :: [Char] -> [Char] -> Bool
areStringsEq [] [] = True
areStringsEq (x:xs) (y:ys) = x == y && areStringsEq xs ys
areStringsEq _ _ = False


times4 :: Integer -> Integer
times4 x = x * 4

-- the part "(Int -> Int)" defines a function passed into the doMult function as a parameter
doMult :: (Int -> Int) -> Int
doMult func = func 3
-- so times4 gets passed in as a function: doMult times4
num3Times4 = doMult times4


-- STUDY NOTES ---
------------------
-- can also return function
x + (y + z) = (x + y) + z

test :: Int
test = (\x -> x + 1) 1

-- 1 + 1
-- 2

(+) :: Int -> Int -> Int
x + y = primAdd x y
-----------------
-----------------

getAddFunc :: (Int -> Int) -> Int
getAddFunc cb = cb 0

adds3 = getAddFunc 3

fourPlus3 = adds3 4

threePlusList = map adds3 [1,2,3,4,5]
-- returns: [4,5,6,7,8]

-- LAMBDA --
-- create functions that don't have a name

dbl1To10 = map (\x -> x * 2) [1..10]
-- returns [2,4,6,8,10,12,14,16,18,20]

-- Conditionals --

doubleEvenNumber y =
    if (y `mod` 2 /= 0)
      then y
      else y * 2

getClass :: Int -> String

getClass n = case n of
    5 -> "Go to Kindergarten"
    6 -> "Go to elementary school"
    _ -> "Go away"

-- MODULES - functions you can use in other programs
-- examples:

{-
at top of module file:
module SampFunctions (getClass, doubleEvenNumber) where
  -- define functions here

then to use in another program:
import SampFunctions

-}


-- Enumeration Type: define list of possible types

data BaseballPlayer = Pitcher
                    | Catcher
                    | Infielder
                    | Outfield
                deriving Show

barryBonds :: BaseballPlayer -> Bool
barryBonds Outfield = True

barryInOF = print(barryBonds Outfield)
-- returns True

-- Custom Types
data Customer = Customer String String Double
    deriving Show

tomSmith :: Customer
tomSmith = Customer "Tom Smith" "123 Main" 20.50

getBalance :: Customer -> Double
getBalance (Customer _ _ b) = b

{-
getBalance tomSmith
returns 20.5
-}

data RPS = Rock | Paper | Scissors

shoot :: RPS -> RPS -> String
shoot Paper Rock = "Paper Beats Rock"
shoot Rock Scissors = "Rock beats Scissors"
shoot Scissors Paper = "Scissors beats Paper"
-- etc
shoot _ _ = "something went wrong"


-- create 2 versions of  a type

data Shape = Circle Float Float Float | Rectangle Float Float Float Float
    deriving Show

area :: Shape -> Float
area (Circle _ _ r) = pi * r ^ 2
area (Rectangle x y x2 y2) = (abs (x2 - x)) * (abs (y2 - y))
-- example using dolar signs
-- area (Rectangle x y x2 y2) = (abs $ x2 - x) * (abs $ y2 - y)

-- Dot operator

sumValue = putStrLn (show (1 + 2))
sumValue2 = putStrLn . show $ 1 + 2

areaOfCircle = area (Circle 50 60 20)
areaOfRect = area $ Rectangle 10 10 100 100


------------------
-- TYPECLASSES ---
------------------
{-
(+) :: Num a => a -> a -> a
-}





-----------------------------
-- Learn me a haskell book
-----------------------------

removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]

-- or --

removeNonUppercaseV2 :: String -> String
removeNonUppercaseV2 st = [ c | c <- st, c `elem` ['A'..'Z']]


-- TYPE VARIABLES --
{-
head :: [a] -> a
-}
-- here a is a type variable and could be anything but traditionally a, b, c, d, e..
-- polymorphic
-- takes in a list of any type and returns an element of that type

{- TYPE ANNOTATIONS

ghci> :t read
read :: (Read a) => String -> a

ghci> read "5" :: Int
5
ghci> read "5" :: Float
5.0
ghci> (read "5" :: Float) * 4
20.0
ghci> read "[1,2,3,4]" :: [Int]
[1,2,3,4]
ghci> read "(3, 'a')" :: (Int, Char)
(3, 'a')

-}


-- VIDEO NOTES --

enumFromToThis :: Int -> Int -> [Int]
enumFromToThis x y =
  if (x > y)
    then []
    else x : enumFromToThis (x + 1) y





-- types of types are kinds

allEven :: [Int] -> Bool
allEven [] = True
allEven (x:xs) = x `mod` 2 == 0 && allEven xs

allP :: [Bool] -> Bool
allP [] = True
allP (x:xs) = x && allP xs

allEven' :: [Int] -> Bool
allEven' xs = allP (map (\x -> x `mod` 2 == 0) xs)

allP' :: (a -> Bool) -> [a] -> Bool
allP' p [] = True
allP' p (x:xs) = p x && allP' xs


{-
HOMEWORK
HANGMAN GAME
REWRITE AS FOLDS: allEven, allP, allP'
-}

allEvenF :: [Int] -> Bool
allEvenF [] = True
allEvenF (x:xs) = (x : foldl (+) 0 xs) `mod` 2 == 0
-- foldl takes a binary operator, starting position, and list
