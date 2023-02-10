% ----------
% Defining a knowledge base with one predicate wizard/1,
% with name "wizard" and one parameter (arity = 1),
% by entering two facts for that predicate.
% ----------

wizard(harry).
wizard(ron).

% ----------
% Playing around with that predicate:
% 
% 1. Asking if value "ron" makes the predicate deliver TRUE.
% 		?- wizard(ron).
% 		true.
%    TRUE because "ron" is a value that matches a fact. 
% 
% 2. Asking if value "draco" makes the predicate deliver TRUE.
% 		?- wizard(draco).
% 		false.
%    FALSE because "draco" does not match a fact.
%
% 3. Asking which values for variable X would deliver TRUE.
% 		?- wizard(X).
% 		X = harry  ;    --- 1st solution found
% 		X = ron.		--- 2nd solution found, no other 
% 						solution available.
% --------


% --------
% Adding to the knowledge base by defining 
% - a predicate muggle/1
% - a predicate father/2
% by one fact per predicate.
% --------

muggle(uncle_vernon).
father(harry,uncle_vernon).

% ----------
% Playing around with those predicates:
% 
% 	?- father(harry,X).
% 	X = uncle_vernon.
% 
% 	?- father(X,X).
% 	false.
%
% 	?- father(harry,X),wizard(X).
% 	false.
%
% 	?- father(harry,X),muggle(X).
% 	X = uncle_vernon.
% ----------