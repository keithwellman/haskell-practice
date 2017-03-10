-- reverses the String "Curry is awesome" to "awesome is Curry"

module Reverse where

rvrs :: String -> String
rvrs x = a ++ c ++ d
  where
    a = drop 9 x
    b = take 9 x
    c = drop 5 b
    d = take 6 x

main :: IO ()
main = print $ rvrs "Curry is awesome"
