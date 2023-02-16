%% -----------------------
%% Examples for lists
%% -----------------------


%% -----------------------
%% member1/2(+Elem,+List) is true when Elem is in List.
%%     member1 lacks cut, so it fails after backtracking 
%%             from last Elem found
%% ?- member1(harry,[ron,harry]).
%% true ;
%% false.
%%
%% ?- member2(harry,[ron,harry]).
%% true.
%% ------------------------

member1(X,[X|_]).
member1(X,[_|Tail]):- member1(X,Tail).

member2(X,[X|_]):- !.
member2(X,[_|Tail]):- member2(X,Tail).


%% ------------------------
%% translate(+InList,+OutList) is true when 
%%     InList is a list of a's, 
%%     OutList is a list of b's and 
%%     both lists are of the same length.
%% -----------------------

translate([],[]).
translate([a|InputTail],[b|OutputTail]):-
		translate(InputTail,OutputTail).


%% -----------------------
%% concatenate(+InList1,+InList2,-OutList) is true when
%%     InList1 and InList2 behind each other are the
%%     same as OutList.
%%
%% -----------------------

concatenate([],L,L). 
concatenate([Head|Tail],L,[Head|NewTail]) :-
		 concatenate(Tail,L,NewTail).


%% -----------------------
%% Example for lists incl. arithmetic
%% -----------------------
%%
%% element_of(+InElement,+InList,-Position) is true when
%%     InElement appears on the Position (counted from the 
%%     head of the list) of InList.
%%
%% -----------------------

element_of(X,[X|_],1).
element_of(X,[_|Tail],Y):-element_of(X,Tail,Z),Y is Z+1.

