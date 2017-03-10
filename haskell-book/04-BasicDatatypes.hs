module Chapter04 where


  -- p 181 #5

  data Mood = Blah | Woot deriving Show

  changeMood :: Mood -> Mood
  changeMood Blah = Woot
  changeMood    _ = Blah

  -- p202 practice

  greetIfCool :: String -> IO ()
  greetIfCool coolness =
    if cool
      then putStrLn "eyyyyy. What's shakin'?"
    else
      putStrLn "pshhhh."
    where cool = coolness == "downright frosty yo"


  -- CHAPTER EXERCISES

  -- 8
  isPalindrome :: (Eq a) => [a] -> Bool
  isPalindrome x = x == reverse x

  -- 9

  myAbs :: Integer -> Integer
  myAbs x = if x >= 0 then x else -x

  -- 10

  f :: (a, b) -> (c, d) -> ((b, d), (a, c))
  f x y = ((snd x, snd y), (fst x, fst y))
