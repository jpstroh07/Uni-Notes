%% --------------------
%% First simple grammar
%% --------------------
%%
%% --- Test 1 (should deliver true)
%% ?- s([harry,likes,hermione],[]).
%% true.
%% ?- s([harry,likes,hermione],X).
%% X = [].
%%
%% --- Test 2 (should not deliver true)
%% ?- s([harry,likes,hermione,not],[]).
%% false.
%% ?- s([harry,likes,hermione,not],X).
%% X = [].
%%
%% --- Test 3
%% ?- s([harry,dreams],[]).
%% true ;
%% false.
%% ?- s([harry,dreams,ron],X).
%% X = [ron];  <-- so sentence is NOT recognized
%% false.
%% -------------------


s(In,Out)  :- np(subj,In,NpOut), vp(NpOut,Out).

np(_,In,Out) :- pn(In,Out). 

vp(In,Out) :- vi(In,Out).
vp(In,Out) :- vt(In,VtOut), np(obj,VtOut,Out).

pn([harry|Out],Out).
pn([ron|Out],Out).
pn([hermione|Out],Out).
vt([likes|Out],Out).
vt([calls|Out],Out).
vt([hears|Out],Out).
vi([dreams|Out],Out).
