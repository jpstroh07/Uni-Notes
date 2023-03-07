%% ---------------------------
%% Grammar with wrong solution for pronouns
%% ---------------------------
%% 
%% --- Test 1 (should deliver true)
%% ?- s([she,kills,him],[]).
%% true.

%% --- Test 2 (should not deliver true)
%% ?- s([him,kills,she],[]).
%% false.
% ---------------------------


s(In,Out)  :- np(In,NpOut), vp(NpOut,Out).

np(In,Out) :- pn(In,Out). 
np(In,Out) :- det(In,DetOut), n(DetOut,Out).
np(In,Out):- pro(In,Out).

vp(In,Out) :- vi(In,Out).
vp(In,Out) :- vt(In,VtOut), np(VtOut,Out).

n([bride|Out],Out).
det([the|Out],Out).
pn([bill|Out],Out).
vi([whistles|Out],Out).
vt([kills|Out],Out).

pro([he|Out],Out).   %% <---
pro([she|Out],Out).  %% <---
pro([him|Out],Out).  %% <---
pro([her|Out],Out).  %% <---



