getHeuristic(H1,H1,HT):-
	HT is 1.

getHeuristic(_,_,HT):-
	HT is -1.

deletiveEditing(Initial,End):-
	deletiveEditing3(Initial,End,End).

checkDubs([],End).

checkDubs([H|T],End):-
	not(member(H,End)),
	checkDubs(T,End).

deletiveEditing3([],[],_).

deletiveEditing3(List,[],OriginalEnd):-
	checkDubs(List,OriginalEnd).

deletiveEditing3([Initial|T1],[End|T2],OriginalEnd):-
	getHeuristic(Initial,End,HT),
	HT>0,
	deletiveEditing3(T1,T2,OriginalEnd).

deletiveEditing3([Initial|T1],[End|T2],OriginalEnd):-
	deletiveEditing3(T1,[End|T2],OriginalEnd).


sumGetter([A,B,C],R):-
    R is A+B+C.

printList(L1,L1).
threeSum(List,Goal,LF):-
	write('Using Depth First:'),nl,
	three_sum_depth(List,Goal,LF).

three_sum_greedy(List,Goal,LF):-
    getAllVals(List,L1),
    getHeuristics(L1,Goal,H),
	H > 0,
    printList(L1,LF).


getHeuristics([A,B,C],Goal,H):-
	sumGetter([A,B,C],R),
	R=Goal,
	H is 1.

getHeuristics([A,B,C],Goal,H):-
	sumGetter([A,B,C],R),
	R\=Goal,
	H is -1.

getAllVals(Lst,[One, Two, Three]) :-
    getVals(One, Lst, Lst1),
    getVals(Two, Lst1, Lst2),
    getVals(Three, Lst2, _).

getVals(Elem, [H|T], RemainderForward) :-
    getVals_(T, H, Elem, RemainderForward).

getVals_(T, H, H, T).

getVals_([H|T], _, Elem, R) :-
	 getVals_(T, H, Elem, R).
