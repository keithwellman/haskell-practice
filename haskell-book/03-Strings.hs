module Chapter03 where

{-

Strings are lists of chars
[a]

"hello" ++ " world"

Concatenation:
(++)
concat

(++) :: [a] -> [a] -> [a]

concat :: [[a]] -> [a]

REMEMBER: the a in the type signature is a type and not a value!
The type variable a is polymorphic.
The a is a variable at the type level and the lists being concatinated must be
of the same type (Numbers, Char, etc) so a == a

WRONG: "hello" ++ [1, 2, 3]
RIGHT: "hello" ++ [' ', 'w','o','r','l','d']


cons operator builds a list:   :
ex: 'K' : "eith"
(:) :: a -> [a] -> [a]

head "Keith"
'K'
tail "keith"
-> "eith"
take 3 "Keith"
-> "Kei"
drop 2 "Keith"
-> "ith"

Get specific index using !!
"Keith" !! 3
-> 't'

TYPECLASS

- The Fractional typeclass requires types to have an instance of the Num typeclass.

so Num and therefore (+) (being part of Num) is the superclass and can use its
subclass Fractional

:i Fractional
class Num a => Fractional a ...

/=  is not equal symbol
|| is or (disjunction)
&& is and (conjunction)
not True   evaluates to False datatype

Use :info to look up info about datatypes that are in scope. If the datatype
isn't in scope, import the module.
(Note that Prelude module automatically brings datatypes in scope by importing)

IF STATEMENTS

if True then "Truthin'" else "Falsin'"
returns "Truthin'"

if CONDITION then EXPRESSION_A else EXPRESSION_B
- condition evaluates to a Bool (True | False) and appropriate branch taken

TUPLES
- allow grouping values of different types in a single value.

3-Tuple (3 is also known as the arity)
(x,y,z)

2-Tuple functions:
fst :: (a,b) -> a
snd :: (a,b) -> b
swap :: (a,b) -> (b,a)


let myTup = (1 :: Integer, "blah")
:t myTup
myTup :: (Integer, [Char])

import Data.Tuple
:i swap
swap :: (a,b) -> (b,a)

LISTS



-}

-- p 158 #3
-- Note that r here is in scope and quickly verified by the indentation

-- area d = pi * (r * r)
--   where r = d / 2

-- variable d not in scope:
-- area' d = pi * (r * r)
-- r = d / 2

-- p 171 a)
-- addExclaimation :: String -> String
-- addExclaimation x = x ++ "!"

-- b)
-- takeFifthChar :: String -> Char
-- takeFifthChar x = x !! 6
