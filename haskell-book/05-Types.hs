module Chapter05 where

{-

- Types are important to readability, safety, and maintainability.

Examples of datatypes:
Bool and tuples

Examples of typeclasses:
Num and Eq

- Expressions reduce to a value, every value has a type.
- Types are like sets where values that share something in common are grouped

Strong Typeing:
- can't use Integer where a String is expected

Static Typing:
- Type is known at compile time and reduces chances of type errors at runtime

Result of Strong/Static typing:
- code is safer and easier to maintain

Type Inference:
- compiler infers the correct type

Functions are values. Types are functions.
fst is a value of type (a, b) -> a

(->) is an infix type that takes two arguments

fst :: (a, b) -> a


NOTE: Each typeclass offers a standard set of functions that can be used across
several concrete types.

Type constraint on multiple arguments

(Num a, Num b) => a -> b -> b

Type constraing requiring a to implement multiple types:
(Ord a, Num a) => a -> Ordering

CURRIED FUNCTIONS:
Uncurried function: one function, many arguments
Curried function: many functions, one argument each
Currying is similar to lambda calculus

(Parametricity means the behavior of a function, with respect to its arguments,
is uniform. The behaviors can not change due to arguements of a different type)
Parametric Polymorphism refers to type variables that are fully polymorphic
(a can become any type of typeclass)

Parametric polymorphic functions have arguments that can become any type
Ex:
Num a => a

a is now restricted to a subset of the Num typeclass

Typeclass Constraints (Num a => a ) limit the set of potential types and pass
common functions that can be used with those values


-}


nonsense :: Bool -> Integer
nonsense True = 805
nonsense False = 31337

typicalCurriedFunction :: Integer -> Bool -> Integer
typicalCurriedFunction i b = i + (nonsense b)

uncurriedFunction :: (Integer, Bool) -> Integer
uncurriedFunction (i, b) = i + (nonsense b)


anonymous :: Integer -> Bool -> Integer
anonymous = \i b -> i + (nonsense b)

anonymousAndManuallyNested :: Integer -> Bool -> Integer
anonymousAndManuallyNested = \i -> \b -> i + (nonsense b)



-- Parametricity exercises p252

-- 1
-- if function
id :: a -> a
id x = x

-- this doesn't work
id' :: a -> a
id' x = 1

-- this does:
idi :: Num a => a -> a
idi x = 1


-- 2
myFubar :: a -> a -> a
myFubar x y = x
myFubar x y = y

-- 3
f :: a -> b -> b
f x y = y


-- CHAPTER EXERCISES

-- does it compile?
-- 1, no because the 10
bigNum = (^) 5
wahoo = bigNum 10

-- 2, yes
x = print
y = print "woohoo!"
z = x "hello world"

-- 3, no due to arguments, corrected:

a = (+)
b = 5
c = a b 10
d = a c 200

-- 4, no because c' isn't in scope, fixed:

a' = 12 + b
b' = 10000 * c'
  where c' = 0

-- TYPE VARIABLE OR SPECIFIC TYPE CONSTRUCTOR?

-- choices: Polymorphic type variable, Constrained Polymorphic type variable,
-- or Concrete type constructor

-- WRITE A TYPE SIGNATURE
--1.
functionH :: [a] -> a
functionH (x:_) = x

--2.
functionC :: Ord a => a -> a -> Bool
functionC x y = if (x > y) then True else False

--3.
functionS :: (a, b) -> b
functionS (x, y) = y

-- GIVEN TYPE WRITE FUNCTION
--1.
i :: a -> a
i x = x

--2.
cT :: a -> b -> a
cT x y = x

--3.
c'' :: b -> a -> b
c'' x y = x

--4.
cTP :: a -> b -> b
cTP x y = y

--5.
r :: [a] -> [a]
r x = reverse x

--6.
co :: (b -> c) -> (a -> b) -> (a -> c)
co f g = f . g  -- this is equivalent to f(g(x))

--7.
aT :: (a -> c) -> a -> a
aT f x = x

--8.
aTP :: (a -> b) -> a -> b
aTP f x = f x

-- FIX IT
--1.
fstString :: [Char] -> [Char]
fstString x = x ++ " in the rain"

sndString :: [Char] -> [Char]
sndString x = x ++ " over the rainbow"

sing = if (x > y) then fstString x else sndString y
  where x = "Singin"
        y = "Somewhere"
--2.
singOther = if (x < y) then fstString x else sndString y
  where x = "Singin"
        y = "Somewhere"

--3.
main :: IO ()
main = do
  print $ 1 + 2
  putStrLn "10"
  print (-1)
  print ((+) 0 blah)
    where blah = negate 1

-- TYPE-KWON-DO
{-
--1.
h x = g (f x)

--2.
e x = w (q x)

--3.
xform (a, b) = (xz a, yz b)

--4.
munge f g x = fst (g (f x))

-}
