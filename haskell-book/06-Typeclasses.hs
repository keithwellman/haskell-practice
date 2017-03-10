module Chapter06 where

-- 1 p338

data TisAnInteger = TisAn Integer

instance Eq TisAnInteger where
  (==) (TisAn anInteger) (TisAn anInteger') = anInteger == anInteger'

-- 2

data TwoIntegers = Two Integer Integer

instance Eq TwoIntegers where
  (==) (Two anInteger anotherInteger) (Two anInteger' anotherInteger') =
    anInteger == anInteger' && anotherInteger == anotherInteger'

-- 3

data StringOrInt = TisAnInt Int | TisAString String

instance Eq StringOrInt where
  (==) (TisAnInt anInt) (TisAnInt anotherInt) = anInt == anotherInt
  (==) (TisAString aString) (TisAString anotherString) = aString == anotherString
  (==) _ _ = False

-- 4

data Pair a = Pair a a

instance Eq Pair where
  (==) (Pair first second) (Pair first' second') = first == first' & second == second'

-- 5

data Tuple a b = Tuple a b

instance Eq Tuple where
  (==) (Tuple one two) (Tuple one' two') = one == two && one' == two'

-- 6

data Which a = ThisOne a | ThatOne a

instance Eq Which where
  (==) (ThisOne thing) (ThisOne thing') = thing == thing'
  (==) (ThatOne thingy) (ThatOne thingy') = thingy == thingy'
  (==) _ _ = False

-- 7

data EitherOr a b = Hello a | Goodbye b

instance Eq EitherOr where
  (==) (Hello you) (Hello you') = you == you'
  (==) (Goodbye youToo) (Goodbye youToo') = youToo == youToo'
  (==) _ _ = False
