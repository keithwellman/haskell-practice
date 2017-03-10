module Practice where
  import Data.Char

  takeUpperCase :: String -> String
  takeUpperCase = filter isUpper

  takeLowerCase :: String -> String
  takeLowerCase = filter isLower

  capitalizeFirst :: String -> String
  capitalizeFirst [] = []
  capitalizeFirst (x:xs) = toUpper x : xs

  capitalize :: String -> String
  capitalize = map toUpper

  returnFirstLetterCap :: String -> Char
  returnFirstLetterCap xs = toUpper $ head xs

  --composed version:
  returnFirstLetterCap' :: String -> Char
  returnFirstLetterCap' xs = toUpper . head $ xs

  -- pointfree version:
  returnFirstLetterCapZ :: String -> Char
  returnFirstLetterCapZ = toUpper . head
