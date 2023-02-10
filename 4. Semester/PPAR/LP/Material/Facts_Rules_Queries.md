# Facts, Rules and Queries

## Symbols

Prolog expressions are comprised of the following truth-functional symbols, which have the same interpretation as in the predicate-calculus:

| English | Predicate Calculus | Prolog |
|---------|--------------------|--------|
| and     | ^                  | ,      |
| or      | v                  | ;      |
| if      | -->                | :-     |
| not     | ~                  | not    |

## Variables and Names

Variables begin with an uppercase letter. Predicate names, function names and the names for objects must begin with a lowercase letter:

```pl
Atom     := {a, ..., z}[a, ..., z, A, ..., Z, 0, ..., 9, _]* | "'[almost any character]+'" | ... <further special chars>
Variable := {A, ..., Z, _}[a, ..., z, A, ..., Z, 0, ..., 9, _]*

harry                   -> Atom
'Professor Dumbledore'  -> Atom
Hermione                -> Variable
_ron                    -> Variable
'(*@+'                  -> Atom
X                       -> Variable
_                       -> anonymous Variable
```

## Facts

A **fact** is a predicate expression that makes a declarative statement about the problem domain. Whenever a variable occurs in a Prolog expression, it is assumed to be **universally quantified**. All Prolog statements must end with a point '.':

```pl
likes(john, susie).                       -> John likes Susie
likes(X, susie).                          -> Everyone likes Susie
likes(john, X).                           -> John likes everybody
likes(john, Y), likes(Y, john).           -> John likes everybody, and everybody likes John
likes(john, susie); likes(john, mary).    -> John likes Susie or John likes Mary
not(likes(john, pizza)).                  -> John does not like pizza
likes(john, susie) :- likes(john, mary).  -> John likes Susie if John likes Mary
```

## Rules

A **rule** is a predicate expression that uses logical implication (:-) to describe a relationship among facts. Thus a Prolog rule takes the form:

```pl
left_and_side :- right_hand_side.
```

This sentence is interpreted as: *left_hand_side **if** right_hand_side*. The **left_hand_side** is restricted to a **single, positive, literal**, which means it must consist of a positive atomic expression. It cannot be negated and it cannot contain logical connectives.

This notation is known as the **Horn clause**. In Horn clause logic, the left hand side of the clause is the conclusion, and must be a single positive literal. The right hand side contains the premises. The Horn clause calculus is equivalent to the first-order predicate calculus.

Example of valid rules:

```pl
friends(X, Y) :- likes(X, Y), likes(Y, X).            -> X and Y are friends if they like each other
hates(X, Y) :- not(likes(X, Y)).                      -> X hates Y if X does not like Y
enemies(X, Y) :- not(likes(X, Y)), not(likes(Y, X)).  -> X and Y are enemies if they do not like each other
```

Example of invalid rules:

```pl
left_of(X, Y) :- right_of(Y, X)             -> missing point
likes(X, Y), likes(Y, X) :- friends(X, Y).  -> LHS is not a single literal
not(likes(X, Y)) :- hates(X, Y).            -> LHS cannot be negated
```

## Queries

The Prolog interpreter responds to **queries** about the facts and rules represented in the database or knowledge base. The database is assumed to represent what is true about a particular problem domain. In making a query you are asking Prolog whether it can prove that your query is true. If so, it answers `true` or displays any **variable bindings** that it made in coming up with the answer. If it fails to prove the query true, it answers `false`.

Whenever the Prolog interpreter is run, it will **prompt** with `?-`.

Example:

```
% Knowledge base
father_of(joe, paul).
father_of(joe, mary).
mother_of(jane, paul).
mother_of(jane, mary).
male(paul).
male(joe).
female(mary).
female(jane).

?- father_of(joe, paul).
true.

?- father_of(paul, mary).
false.

?- father_of(X, mary).
X = joe.
```

## Closed World Assumption

The Prolog interpreter assumes that the database is a **closed world** -- that is, if it cannot prove something is true, it assumes that it is false. This is also known as **negation as failure** -- that is, something is false if Prolog cannot prove it true given the facts and rules in its database. In this case, in may well be (in the real world), that Paul is the father of Mary, but since this cannot be proved given the current family database, Prolog concludes that it is false. So Prolog assumes that its database contains complete knowledge of the domain it is being asked about.

## Prolog's Proof Procedure

In responding to queries, the Prolog interpreter uses a **backtracking** search. To see how this works, let's add the following rules to the database: 

```pl
parent_of(X, Y) :- father_of(X, Y).  -> Rule 1
parent_of(X, Y) :- mother_of(X, Y).  -> Rule 2
```

And let's trace how Prolog would process the query. Suppose the facts and rules of this database are arranged in the order in which they were input:

```pl
?- parent_of(jane, mary).

parent_of(jane, mary) -> Prolog starts here and searches for a matching fact or rule

parent_of(X, Y)       -> Prolog unifies the query with the first rule using {jane/X, mary/Y}, giving parent_of(jane, mary) :- father_of(jane, mary)

father_of(jane, mary) -> Prolog replaces LHS with RHS and searches. This fails to match father_of(joe, paul) and father_of(joe, mary), so this FAILS. 
                         Prolog then Backtracks to the second rule and unifies with {jane/X, mary/Y}, so it matches parent_of(jane, mary) :- mother_of(jane, mary)

mother_of(jane, mary) -> Prolog replaces LHS with RHS and searches

true.                 -> Prolog finds a match with literal and so succeeds
```