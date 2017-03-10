module Practice where

  type Peg = String
  type Move = (Peg, Peg)
  hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
  hanoi 0 _ _ _                 = []
  hanoi 1 start end _           = [(start, end)]
  hanoi numDiscs start end temp =
    hanoi (numDiscs - 1) start temp end ++
    hanoi 1 start end temp ++
    hanoi (numDiscs - 1) temp end start
-- move n-1 disks to temp, move bottom to end, move n-1 from temp to end

-- Example: hanoi 2 "a" "b" "c" == [("a","c"),("a","b"),("c","b")]
-- Example: hanoi 3 "a" "b" "c" == [("a","b"),("a","c"),("b","c"),("a","b"),("c","a"),("c","b"),("a","b")]
