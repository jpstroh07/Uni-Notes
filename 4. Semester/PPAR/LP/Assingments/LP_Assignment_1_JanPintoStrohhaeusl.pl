/* Day 1 */

/* Task 1 - The Gryffindor table */

sits_right_of(dean_Thomas, ron_Weasly).
sits_right_of(ron_Weasly, natalie_MacDonald).
sits_right_of(natalie_MacDonald, harry_Potter).
sits_right_of(harry_Potter, hermione_Granger).
sits_right_of(hermione_Granger, seamus_Finnigan).
sits_right_of(seamus_Finnigan, colin_Creevey).
sits_right_of(colin_Creevey, ginny_Weasly).
sits_right_of(ginny_Weasly, angeline_Johnson).
sits_right_of(angeline_Johnson, katie_Bell).
sits_right_of(katie_Bell, lee_Jordan).
sits_right_of(lee_Jordan, dennis_Creevey).
sits_right_of(dennis_Creevey, fre_Weasly).
sits_right_of(fre_Weasly, george_Weasly).
sits_right_of(george_Weasly, neville_Longbottom).
sits_right_of(neville_Longbottom, alicia_Spinnet).
sits_right_of(alicia_Spinnet, parvati_Patil).
sits_right_of(parvati_Patil, lavender_Brown).
sits_right_of(lavender_Brown, dean_Thomas).

sits_left_of(X, Y) :- sits_right_of(Y, X).
are_neighbors_of(Left, Middle, Right) :- sits_left_of(Middle, Left), sits_right_of(Middle, Right).
next_to_each_other(X, Y) :- sits_right_of(X, Y); sits_left_of(X, Y).

/***
Question: Is Hermione to the right of Harry?
Query: ?- sits_right_of(harry_Potter, hermione_Granger).
Result: true.

Question: Is Harry to the right of Ginny?
Query: ?- sits_right_of(ginny_Weasly, harry_Potter).
Result: false.

Question: Who is to the right of Ginny?
Query: sits_right_of(ginny_Weasly, X).
Result: X = angeline_Johnson.

Question: Who is sitting at the table?
Query: sits_right_of(X, Y).
Results:
    X = dean_Thomas,
    Y = ron_Weasly ;
    X = ron_Weasly,
    Y = natalie_MacDonald ;
    X = natalie_MacDonald,
    Y = harry_Potter ;
    X = harry_Potter,
    Y = hermione_Granger ;
    X = hermione_Granger,
    Y = seamus_Finnigan ;
    X = seamus_Finnigan,
    Y = colin_Creevey ;
    X = colin_Creevey,
    Y = ginny_Weasly ;
    X = ginny_Weasly,
    Y = angeline_Johnson ;
    X = angeline_Johnson,
    Y = katie_Bell ;
    X = katie_Bell,
    Y = lee_Jordan ;
    X = lee_Jordan,
    Y = dennis_Creevey ;
    X = dennis_Creevey,
    Y = fre_Weasly ;
    X = fre_Weasly,
    Y = george_Weasly ;
    X = george_Weasly,
    Y = neville_Longbottom ;
    X = neville_Longbottom,
    Y = alicia_Spinnet ;
    X = alicia_Spinnet,
    Y = parvati_Patil ;
    X = parvati_Patil,
    Y = lavender_Brown ;
    X = lavender_Brown,
    Y = dean_Thomas.

Question: Who is sitting two seats to the right of Neville?
Query: ?- are_neighbors_of(neville_Longbottom, X, Y).
Results:
    X = alicia_Spinnet,
    Y = parvati_Patil.

Question: Who is sitting between Neville and Parvati?
Query: ?- are_neighbors_of(neville_Longbottom, X, parvati_Patil).
Result: X = alicia_Spinnet.
***/

/* Task 2: Harry's family relationships */

male(paul).
male(albert).
male(vernon).
male(james).
male(dudley).
male(harry).

female(helen).
female(ruth).
female(petunia).
female(lili).

parent_of(paul, petunia).
parent_of(paul, lili).
parent_of(helen, petunia).
parent_of(helen, lili).
parent_of(albert, james).
parent_of(ruth, james).
parent_of(vernon, dudley).
parent_of(petunia, dudley).
parent_of(lili, harry).
parent_of(james, harry).

father_of(Father, Child) :- male(Father), parent_of(Father, Child).
mother_of(Mother, Child) :- female(Mother), parent_of(Mother, Child).

grandfather_of(Grandpa, Child) :- father_of(Grandpa, X), parent_of(X, Child).
grandmother_of(Grandma, Child) :- mother_of(Grandma, X), parent_of(X, Child).

brother_of(Brother, Person) :- male(Brother), parent_of(X, Brother), parent_of(X, Person), Brother \== Person.
sister_of(Sister, Person) :- female(Sister), parent_of(X, Sister), parent_of(X, Person), Sister \== Person.

uncle_of(Uncle, Person) :- brother_of(Uncle, X), parent_of(X, Person); father_of(Uncle, X), mother_of(Y, X), aunt_of(Y, Person).
aunt_of(Aunt, Person) :- sister_of(Aunt, X), parent_of(X, Person).

ancestor_of(Ancestor, Child) :- father_of(Ancestor, Child); mother_of(Ancestor, Child); grandfather_of(Ancestor, Child); grandmother_of(Ancestor, Child).

not_parent(Parent, Child) :- not(parent_of(Parent, Child)).

/***
Question: Does Harry have an uncle? Who?
Query: ?- uncle_of(X, harry).
Result: X = vernon.

Question: Who are the grandparents of Harry?
1. Query: ?- grandfather_of(X, harry).
1. Results:
    X = paul ;
    X = albert.
2. Query: ?- grandmother_of(Y, harry).
2. Results:
    Y = helen ;
    Y = ruth.

Question: Who are the grandchildren of Paul and Helen?
1. Query:?-  grandfather_of(paul, X).  
1. Results:
    X = dudley ;
    X = harry.
2. Query: ?- grandmother_of(helen, Y).
2. Results:
    Y = dudley ;
    Y = harry.

Question: Does James have a sister?
Query: ?- sister_of(X, james).
Result: false.

Question: Is Albert an ancestor of Harry?
Query: ?- ancestor_of(albert, harry).
Result: true.

Question: Who are the ancestors of Harry?
Query: ?- ancestor_of(X, harry).
Results:
    X = james ;
    X = lili ;
    X = paul ;
    X = albert ;
    X = helen ;
    X = ruth.

Question: Is Dudley an ancestor of Harry?
Query: ?- ancestor_of(dudley, harry).
Result: false.

Question: Who are the descendants of James?
Query: ?- ancestor_of(james, X).
Result: X = harry.

Question: Is Dudley a parent of Harry?
Query: ?- parent_of(dudley, harry).
Result: false.
***/

/* Task 3 - Finding a path through the maze */

connected(1,2). 
connected(3,4). 
connected(5,6). 
connected(7,8). 
connected(9,10). 
connected(11,12). 
connected(13,14). 
connected(15,16). 
connected(17,18). 
connected(19,20). 
connected(2,5). 
connected(4,7). 
connected(4,3). 
connected(9,11). 
connected(14,13). 
connected(11,3). 
connected(12,15). 
connected(3,17). 
connected(16,19).

% path(Start, End) :- 