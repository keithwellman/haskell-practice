module Chapter01 where

{- Haskell Notes from 1st Principles

Haskell is a pure language - A function is guaranteed to return the same result if
given the same value. (Referential transparity)

Haskell is a functional language - everything is an expression. Functions are
composed of reducable expressions. Expressions can be values, variables, and functions.

Haskell is the result of mathematics and computer science research.

Haskell is more expressive than Ruby.

-}

-- Lambda

{-

Haskell expressions are translatable into lambda expressions.

The Lambda Calculus formalizes the concept of effective computability and so
determines which problems and classes of problems can be solved.

Benefits include a high degree of abstraction and composability (code can be
reused easily). NOTE: code resuse seems to imply that the functional nature of
Haskell allows for sorta lego blocks of code.

NOTE: CRITICAL CONCEPT to FUNCTIONAL PROGRAMMING:
Functions map a set of inputs to a set of outputs.


Lambda Terms:

1.) Expressions (super set of vars and abstractions: expressions can be variables,
abstractions, or both)

2.) Variables

3.) Abstractions

- The simplest expression is a single variable.

- Variable: names for potential inputs to functions

- Abstraction: a function. A lambda term that has a head, body. It's applied
to an argument (input to a function)

Head: lambda (λ) followed by a variable name.
Body: an expression

Simple function: λx.x
(this is an anonymous function whereas a named function can be called by name but
an anonymous function cannot because it doesn't have a name)

λ x . x
|___|
  |_________ This is the head


λ x . x
  ^_________ function paramater. This binds any var with the same name in the
  function (all x's will have the same value)

λ x . x
      ^_________ This is the body. When the lambda is applied to an argument,
      this is returned.

λ x . x
    ^_________ Seperates Head and Body

Beta Reduction (apply a lambda term to an argument, replace bound variables with
argument, and eliminate head):

- The head goes away as soon an the function is applied to an argument because
it's only purpose was to bind the variable.


Apply the function to 2:

    (λx.x) 2
           2 is returned

Here's another function:
(λx.x+1)

Apply it to 2:
    (λx.x+1) 2
            2+1
            3 is returned

- Left associative

(λx.x)(λy.y)z
((λx.x)(λy.y))z
[x:=(λy.y)]
(λy.y)z
[y:=z]
z

Free Variables:

λx.xy

y is the free variable because it is not names in the head

NOTE: Each lambda can only bind one parameter and can only accept 1 argument.

λxy.xy is shorthand for two nested lambdas

λx.(λy.xy)

Beta Normal Form: Can't beta reduce (apply lambdas to arguments) terms further.

Combinators: Lambda with no free variables so the result is combining
arguments. Every term in the body is used in the head.

-}
