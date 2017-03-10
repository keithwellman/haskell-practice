module Chapter10 where

  -- foldr (:) [] [1..3]
  -- [1,2,3]

-- foldr

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr f acc []     = acc
foldr f acc (x:xs) = f x (foldr f acc xs)

-- so
foldr (+) 0 (1 : 2 : 3 : [])

-- associates as
-- 1  + (2  + (3  +  0))

-- foldl

foldl :: (b -> a -> b) -> b -> [a] -> b
foldl f acc []     = acc
foldl f acc (x:xs) = foldl f (f acc x) xs

-- so
foldl (+) 0 (1 : 2 : 3 : [])

-- associates as
-- ((0  +1)  +  2)  +  3


-- take first 3 letters of each string and return a concatonated string
foldr (\ a b -> take 3 a ++ b) "" ["Apple", "Banana", "Cantelope"]
