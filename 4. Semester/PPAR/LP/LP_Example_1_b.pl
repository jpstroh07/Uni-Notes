% ------------
% Knowledge base 2
% ------------

wizard(harry).
wizard(ron).
wizard(hermione).

muggle(uncle_vernon).
muggle(aunt_petunia).

father(harry,uncle_vernon).

% ------------
% Queries for that knowledge base
% 
% ?- muggle(harry).
% false.
% 
% ?- wizard(dumbledore).
% false.
%
% ?- muggle(X).
% X = uncle_vernon   ;
% X = aunt_petunia. -- no rule, only facts,
%
% ?- witch(hermione).
% ERROR: Undefined procedure: witch/1
% 
% -----------

% -----------
% adding some more predicates to the knowledge base
% -----------

eating(dudley).
kicking(dudley).
happy(dudley) :- kicking(dudley).
happy(dudley) :- eating(dudley).
happy(aunt_petunia) :- happy(dudley).
happy(uncle_vernon) :- happy(dudley), unhappy(harry).

% -----------
% Some queries
%
% ?- happy(aunt_petunia).
% true  ;
% true.
%
% ?- happy(uncle_vernon).
% ERROR: Undefined procedure: unhappy/1
%
% ?- happy(X).
% X = dudley   ;
% X = dudley   ;
% X = aunt_petunia   ;
% X = aunt_petunia   ;
% ERROR: Undefined procedure: unhappy/1
% -------------

