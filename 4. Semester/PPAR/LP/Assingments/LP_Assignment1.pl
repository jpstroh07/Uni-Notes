% --------------------------- Task 1 --------------------------------

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
are_neighbors_of(X, Y, Z) :- sits_left_of(Z, X), sits_right_of(Z, Y).
next_to_each_other(X, Y) :- sits_right_of(X, Y); sits_left_of(X, Y).

% --------------------------- Task 2 --------------------------------

