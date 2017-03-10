module Chapter02 where

{-

Stack (command line utility manager):
Command line application used for installing utilities and managing those utilities
to include GHC.
- location: ~/.stack/

GHC - Compiler

Stackage.org:
List of packages guaranteed to work with each other and the specified GHC version

Wreq - http web client library
stack build wreq (installs from terminal)
supports JSON

REPL: Read-Eval-Print-Loop (prelude)

Using stack ghci:
:load filename.hs
:quit
:module (return to prelude after loading a file)

In prelude use let to define a function:
let triple x = x * 3

-Names of Modules and Types (such as Integer) start with capital

(x:xs): a list where the head of the list is x and the rest is xs
NOTE: x and xs could be anything, this is convention

Associativiy:

:info (*)
infixl 7 *

Declaring Values:
The order of declarations in the source code doesn't matter because GHCi loads
the entire file at once

`div` is integral division rounded down
ex: 9 `div` 4 returns 2

9 `mod` 4 returns 1

`rem` is similar to mod but after modulo division

---> When to use $ <---
 it's used in place of parentheses
 (2^) $ 2 + 2
 (2^) (2 + 2)
(evaluate right side first)

(2^) $ (*30) $ 2 + 2
(2^) $ (*30) $ 4
(2^) $ 120
= 2^120

f x = let x = 5 in x + 2

f x      = x + 2
 where x = 5


RESOURCES:

Let vs where
https://wiki.haskell.org/Let_vs._Where


-}
