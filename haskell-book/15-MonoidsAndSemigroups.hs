module Practice where


import Data.Semigroup
import Test.QuickCheck


-- from Haskell Programming from first Principles
-- Algebras, Laws, Monoids, Semigroups

-- NOTES:
-- Algebras: some operations and the set (type) they operate over
-- Algebra is the study of the rules governing the manipulation of sympols used in math
-- uses abstractions (ex: variables such as List)

-- Monoid is an algebra used in Haskell, it is a *binary* *associative*
-- operation with an *identity*
-- (a function with 2 arguments and 2 laws (associative and identity))

-- this is a focus on the rules constraining values, if thing is an abstract
-- construct, the focus is on the rules governing that things manipulation without
-- caring too much about the value it contains.

-- Can be defined by typeclasses
-- the typeclasses define the set of operations

-- Monoid is the typeclass that generalizes these laws across types!!
{-
class Monoid m where
  mempty :: m
  mappend :: m -> m -> m
  mconcat :: [m] -> m
  mconcat = foldr mappend mempty
-}
-- monoid instance for lists
--instance Monoid [a] where
--  mempty = []
--  mappend = (++)

-- example of identity
--mappend :: Monoid a => a -> a -> a
--mappend [1..5] [] = [1..5]
--mappend [] [1..5] = [1..5]

--mempty :: Monoid a => a
--mappend x mempty = x
--mappend mempty x = x

-- type Integer does not have a Monoid instance

-- Sum and Product newtypes signal which Monoid instance to use

-- "using newtype constrains the datatype to having a single unary data constructor and newtype guarantees no additional runtime overhead in “wrapping” the original type."

-- infix operator for mappend: <>

{-
Prelude Data.Monoid> :t (<>)
(<>) :: Monoid m => m -> m -> m
Prelude Data.Monoid> mappend (Sum 8) (Sum 9)
Sum {getSum = 17}
Prelude Data.Monoid> mappend mempty Sum 9
Sum {getSum = 9}

Prelude Data.Monoid> (Sum 1) <> (Sum 2) <> (Sum 3)
Sum {getSum = 6}
Prelude Data.Monoid> (Sum 1) `mappend` (Sum 2) `mappend` (Sum 3)
Sum {getSum = 6}

using mconcat:
mconcat [(Sum 8), (Sum 9), (Sum 10)]
Sum {getSum = 27}

using getSum and getProduct to unwrap the value
Prelude Data.Monoid> getSum $ mappend (Sum 1) (Sum 1)
2
Prelude Data.Monoid> getProduct $ mappend (Product 5) (Product 5)
25


-}


-- Abelian monoid: commutative monoid
-- Laws make up what algebras are.

{-
All is boolean conjunction, Any is the Monoid of boolean disjunction

Prelude Data.Monoid> All True <> All True
All {getAll = True}
Prelude Data.Monoid> All True <> All False
All {getAll = False}
Prelude Data.Monoid> Any True <> Any False
Any {getAny = True}
Prelude Data.Monoid> Any False <> Any False
Any {getAny = False}

-}


-- Exercise: Optional Monoid p 937
{-
data Optional a = Nada
                | Only a
                deriving (Eq, Show)

instance Monoid a => Monoid (Optional a) where
  mempty                    = Nada
  mappend  Nada    (Only a) = Only a
  mappend  Nada     Nada    = Nada
  mappend (Only a)  Nada    = Only a
  mappend (Only a) (Only b) = Only (a <> b)
-}

-- semigroup drops the identity requirement. It has a strict subset of laws
-- from Monoid
--class Semigroup a => Monoid a where ...

-- parametricity: ensures all instances of a polymorphic function act the same way.

--Magma monoid: weaker than a semigroup! Drops associativity.

--CHAPTER EX:

-- #1

data Trivial = Trivial deriving (Eq, Show)

instance Semigroup Trivial where
  _ <> _ = Trivial

instance Arbitrary Trivial where
  arbitrary = return Trivial

semigroupAssoc :: (Eq m, Semigroup m) => m -> m -> m -> Bool
semigroupAssoc a b c = (a <> (b <> c)) == ((a <> b) <> c)

type TrivialAssoc = Trivial -> Trivial -> Trivial -> Bool

newtype Identity a = Identity a deriving (Eq, Show)

instance Semigroup a => Semigroup (Identity a) where
  Identity a <> Identity b = Identity (a <> b)

data Two a b = Two a b

instance (Semigroup a, Semigroup b) => Semigroup (Two a b) where
  Two a b <> Two x y = Two (a <> x) (b <> y)


main :: IO ()
main = quickCheck (semigroupAssoc :: TrivialAssoc)
