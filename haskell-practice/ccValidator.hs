module Practice where

  --CIS 194 homework http://www.seas.upenn.edu/~cis194/spring13/hw/01-intro.pdf

  toDigits :: Integer -> [Integer]
  toDigits 0 = []
  toDigits n
    | n < 1 = []
    | otherwise = toDigits (n `div` 10) ++ [n `mod` 10]

  toDigitsRev :: Integer -> [Integer]
  toDigitsRev n
    | n < 1 = []
    | otherwise = n `rem` 10 : toDigitsRev (n `quot` 10)
    -- get the last digit and add it to the list created by calling toDigitsRev
    -- (with quot -rounds toward zero) with the rest of the digits

  doubleEveryOther :: [Integer] -> [Integer]
  doubleEveryOther [] = []
  doubleEveryOther [x] = [x]
  doubleEveryOther (x:y:xs) = x : (y * 2) : doubleEveryOther xs
  -- evaluate the first two items in the list and then do the same with the
  -- rest of the list.

  sumDigits :: [Integer] -> Integer
  sumDigits []     = 0
  sumDigits (x:xs)
    | x < 10 	    = x + sumDigits xs
	  | otherwise 	= sumDigits ((toDigits x) ++ xs)
  -- there are 2 cases here to handle every digit of a given number
  -- (some items in the list might be Integers greater than 10)
  -- sum the digits of that number with the rest of the list

  validate :: Integer -> Bool
  validate n = (sumDigits $ doubleEveryOther $ toDigitsRev n) `mod` 10 == 0
