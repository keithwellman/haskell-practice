exclaim x = x ++ "!"

threeLetters :: String -> [Char]
threeLetters x = take 3 x

thirdLetter :: String -> Char
thirdLetter y = y !! 3

letterIndex :: Int -> Char
letterIndex z = "Curry is awesome!" !! z
