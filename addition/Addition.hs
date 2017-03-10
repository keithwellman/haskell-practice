-- from Haskell Programming from first Principles
-- writing tests, random generators
module Addition where

import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec $ do
  describe "Addition" $ do
    it "15 divided by 3 is 5" $ do
      dividedBy 15 3 `shouldBe` (5 :: Integer, 0 :: Integer)
    it "22 divided by 5 is 4 remainder 2" $ do
      dividedBy 22 5 `shouldBe` (4  :: Integer, 2  :: Integer)
    it "x + 1 is always greater than x" $ do
      property $ \x -> x + 1 > (x :: Int)


dividedBy :: Integral a => a -> a -> (a, a)
dividedBy num denom = go num denom 0
  where go n d count
          | n < d = (count, n)
          | otherwise = go (n - d) d (count + 1)

-- generating random values
trivialInt :: Gen Int
trivialInt = return 1
{-
*Addition Addition> sample' trivialInt
[1,1,1,1,1,1,1,1,1,1,1]
-}

oneThroughThree :: Gen Int
oneThroughThree = elements [1, 2, 3]
{-
sample' oneThroughThree
[3,3,2,1,3,1,2,3,1,1,2]
-}

genBool :: Gen Bool
genBool = choose (False, True)
-- sample genBool

genBool' :: Gen Bool
genBool' = elements [False, True]
-- sample' genBool -> [True,False,True,True,False,True,True,False,False,False,False]

genOrdering :: Gen Ordering
genOrdering = elements [LT, EQ, GT]
--sample' genOrdering -> [LT,LT,LT,GT,EQ,LT,EQ,EQ,GT,EQ,GT]

genChar :: Gen Char
genChar = elements ['a'..'z']
-- sample' genChar -> "wlqbjesxsuj"

genTuple :: (Arbitrary a, Arbitrary b) => Gen (a, b)
genTuple = do
  a <- arbitrary
  b <- arbitrary
  return (a, b)
-- sample genTuple -> ((), ())
-- sample (genTuple :: Gen (Int, Float)) ->
-- (-1, 0.2516606)

genThreeple :: (Arbitrary a, Arbitrary b, Arbitrary c) =>
                Gen (a, b, c)
genThreeple = do
  a <- arbitrary
  b <- arbitrary
  c <- arbitrary
  return (a, b, c)

genEither :: (Arbitrary a, Arbitrary b) => Gen (Either a b)
genEither = do
  a <- arbitrary
  b <- arbitrary
  elements [Left a, Right b]

genMaybe :: Arbitrary a => Gen (Maybe a)
genMaybe = do
  a <- arbitrary
  elements [Nothing, Just a]

-- using QuickCheck to get more Just values
genMaybe' :: Arbitrary a => Gen (Maybe a)
genMaybe' = do
  a <- arbitrary
  frequency [ (1, return Nothing)
            , (3, return (Just a))]
  elements [Nothing, Just a]


-- using QuickCheck without hspec

prop_additionGreater :: Int -> Bool
prop_additionGreater x = x + 1 > x

runQc :: IO ()
runQc = quickCheck prop_additionGreater
