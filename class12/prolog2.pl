knows_scheme(bob).
knows_scheme(alice).
knows_prolog(alice).
passes_240(X) :- knows_scheme(X), knows_prolog(X).

% recursion
factorial(1,1).
factorial(N, F) :- N > 1, N1 is N - 1, factorial(N1, F1), F is N * F1.


factorial_cut(1,1) :- !.
factorial_cut(N, F) :- N1 is N - 1, factorial_cut(N1, F1), F is N * F1.

division(nl_west, [lad, az, co, sd, sf]).
division(al_west, [laa, hou, tex, sea, oak]).
in_division(Team, Division) :- division(Division, Members), member(Team, Members).

%math
double(X,Y) :- Y is 2 * X.
increment(X,Y) :- Y is X + 1.
less_than_square_root(X,Y) :- Y < sqrt(X).
tangent(X,Y) :- Y is tan(X).
divides(X,Y) :- 0 is X mod Y.

%family
father(bob, alice).
mother(sue, james).
mother(sue, alice).
mother(ann, sue).

dad(Father,Child) :- father(Father,Child).
child(Child,Father) :- father(Father,Child).
child(Child,Mother) :- mother(Mother,Child).
parent(Father,Child) :- father(Father,Child).
parent(Mother,Child) :- mother(Mother,Child).

%BAD ancestor(Ancestor,Descendant) :- ancestor(Ancestor,Intermediary), 
%BAD	                              ancestor(Intermediary,Descendant).
ancestor(Ancestor,Descendant) :- parent(Ancestor,Descendant).
ancestor(Ancestor,Descendant) :- parent(Ancestor,Intermediary),
                                 ancestor(Intermediary,Descendant).

% lists & pairs
% PAIR: [ Head | Tail ]
% LIST: [] or [ Head | TailList ]

pairparts([H|T], H, T).
starts_with_same([H, H | _T]).
list_of_size_three([_, _, _]).
third_in_list([_, _, X | _T], X).

% return first item in a list
first([H|_T], H).

% last element of a list
lastelement([X], X).
lastelement([_H|T], Last) :- lastelement(T, Last).

%firsttwo/3
firsttwo([H1, H2 | _T], H1, H2).
%firsttwo/2
firsttwo([H1, H2 | _T], [H1, H2]).

listsize([], 0) :- !.
listsize([_H | T], S) :- listsize(T, SizeT), S is SizeT + 1.

%increment each member of list
addonetoall([], []) :- !.
addonetoall([H | T], [H1 | T1]) :- H1 is H + 1, addonetoall(T, T1).

% islist predicate
islist([]).
islist([_H|T]) :- islist(T).

% keep only multiples of 3
onlymults3([],[]) :- !.
onlymults3([H | T], [H | T1]) :- 0 is H mod 3, !, onlymults3(T, T1).
onlymults3([_H | T], T1) :- onlymults3(T, T1).

% remove matching
removeit([],_X,[]) :- !.
removeit([X | T], X, T1) :- !, removeit(T, X, T1).           % Head is what we are removing
removeit([H | T], X, [H | T1]) :- !, removeit(T, X, T1). 

% remove every other one
remove_eoo([], []) :- !.
remove_eoo([X], [X]) :- !.
remove_eoo([H, _H2 | T], [H | TailWithEOORemoved]) :- remove_eoo(T, TailWithEOORemoved).







