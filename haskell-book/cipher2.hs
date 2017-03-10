module Cipher where

  import Data.Char

  caesar :: String -> Int -> String
  caesar [] _ = []
  caesar (x:xs) n = chr (ord 'a' + mod (ord x - ord 'a' + n) 26) : caesar xs n

  unCaesar :: String -> Int -> String
  unCaesar = caesar
