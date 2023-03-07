%% ---------------------------
%% Grammar with correct solution for pronouns
%% ---------------------------
%% 
%% --- Test 1 (should deliver true)
%% ?- s([she,kills,him],[]).
%% true ;
%% false.
%%
%% --- Test 2 (should not deliver true)
%% ?- s([him,kills,she],[]).
%% false.
% ---------------------------


s(In,Out)  :- np(subj,In,NpOut), vp(NpOut,Out).

np(_,In,Out) :- pn(In,Out). 
np(_,In,Out) :- det(In,DetOut), n(DetOut,Out).
np(CASE,In,Out):- pro(CASE,In,Out).

vp(In,Out) :- vi(In,Out).
vp(In,Out) :- vt(In,VtOut), np(obj,VtOut,Out).

n([bride|Out],Out).
det([the|Out],Out).
pn([bill|Out],Out).
vi([whistles|Out],Out).
vt([kills|Out],Out).

pro(subj,[he|Out],Out).    %% <----
pro(subj,[she|Out],Out).   %% <----
pro(obj,[him|Out],Out).    %% <----
pro(obj,[her|Out],Out).    %% <----


%% --- Test 1 (should deliver true)
%% ?- s([she,kills,him],[]).
%% true.

%% --- Test 2 (should not deliver true)
%% ?- s([him,kills,she],[]).
%% false.



