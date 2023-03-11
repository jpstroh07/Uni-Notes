s --> np, vp.	  %% s(In,Out)  :- np(In,NpOut), vp(NpOut,Out).

np --> pn.		  %% np(In,Out) :- pn(In,Out). 
np --> det, n.	  %% np(In,Out) :- det(In,DetOut), n(DetOut,Out).

vp --> vi.		  %% vp(In,Out) :- vi(In,Out).
vp --> vt, np.	  %% vp(In,Out) :- vt(In,VtOut), np(VtOut,Out).

n --> [bride].	  %% n([bride|Out],Out).
det --> [the].	  %% det([the|Out],Out).
pn --> [bill].	  %% pn([bill|Out],Out).
vi --> [whistles].  %% vi([whistles|Out],Out).
vt --> [kills].	  %% vt([kills|Out],Out).


%% --- Test 1
%% ?- s([the,bride,kills,bill],[]).
%% true .


s(s(NPT,VPT))    --> np(NPT), vp(VPT).

np(np(PNT))      --> pn(PNT).
np(np(DetT,NT))  --> det(DetT), n(NT).

vp(vp(ViT))      --> vi(ViT).
vp(vp(VtT,NPT))  --> vt(VtT), np(NPT).

n(n(bride))      --> [bride].
det(det(the))    --> [the].
pn(pn(bill))     --> [bill].
vi(vi(whistles)) --> [whistles].
vt(vt(kills))    --> [kills].


%% --- Test 2
%% ?- s(Tree,[the,bride,kills,bill],[]).
%% Tree = s(np(det(the), n(bride)), vp(vt(kills), np(pn(bill)))).


