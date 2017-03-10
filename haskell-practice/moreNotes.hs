-- count the number of words in a text file (or change words to lines to count num of lines. How can characters be parsed?)
main = interact wordCount
  where wordCount input = show (length (words input)) ++ "\n"

{-
- Every expression has a Type. (and every function)
- the value True has the type of Bool
- the value "foo" has the type of String (== [Chars])
"foo" :: [Chars]

TYPES and Haskell's Type System:
- Strongly Typed
  - guaranteed no type errors
  - ex: pass in a String intead of a Bool (Haskell won't compile)
  - well typed: expressions obey the language
  - catches bug before they can cause problems

- Statically Typed
  - compiler knows the type of every value and expression
  - at compile time.

- Type Inference
  - can declare the type of any value and Haskell can
  - automatically deduce the Type
  - This makes Haskell code concise


SIDE EFFECTS
- a function has side effects if it relies on some global
- variable that might be changed by other parts of the
- program.

Functions with side effects begin with IO
ex: :t readFile
readFile :: FilePath -> IO String

No side effects == Pure
- functions only rely on inputs explicitly provided
-}

add :: Integer -> Integer -> Integer
add a b = a + b

-- drop n items from a list
myDrop :: Int -> [a] -> [a]
myDrop n xs = if n <=0 || null xs
  then xs
  else myDrop (n - 1) (tail xs)

-- Exersise from Real World Haskell 1-3

lastButOne :: [a] -> a
lastButOne xs = last (take ((length xs) - 1) xs)
-- not safe because it doesn't handle list smaller than 2
