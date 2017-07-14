replicate([],[]) :- !.
replicate([H | T], [H, H | T1]) :- replicate(T,T1).

do_random_stuff([],[]) :- !.
do_random_stuff([2 | T], [boo | T1]) :- do_random_stuff(T,T1).
do_random_stuff([H | T], [[H, I, 6, J, K, horray] | T1]) :- 
	I is H * 2, J is I - 1, K is H + I + J, do_random_stuff(T,T1).

% rule with no head
:- replicate([1,2,3], X), write(X).

% rule with no parameters
do_replicate :- replicate([2,3,4],X), write(X).
do_replicate :- replicate([4,5,6],X), write(X).  % how can we get this to run?

% limiting output - a condition as first clause of the rule body
replace_evens([],[]).
replace_evens([H|T], [X|T1]) :- 0 is H mod 2, X is H - 1, replace_evens(T, T1).
replace_evens([H|T], [H|T1]) :- 1 is H mod 2, replace_evens(T, T1).

% limiting output with cut
replace_odds([],[]).
replace_odds([H|T], [X|T1]) :- 1 is H mod 2, !, X is H - 1, replace_odds(T, T1).
replace_odds([H|T], [H|T1]) :- replace_odds(T, T1).

% tail-recursion
fib-tail(N, F) :- !, fib-tail(N, 1, 1, F).
fib-tail(1, F2, _, F2) :- !.
fib-tail(N, F2, F1, F) :- N1 is N - 1, F0 is F1 + F2, fib-tail(N1, F1, F0, F).

% cut
warm_blooded(chicken).
warm_blooded(cat).
warm_blooded(dog).
four_legs(cat).
four_legs(dog).
two_legs(chicken).
has_tail(cat).
has_tail(dog).
has_tail(chicken).

mammal0(M) :- warm_blooded(M), four_legs(M). 
mammal1(M) :- !, warm_blooded(M), four_legs(M). 
mammal2(M) :- warm_blooded(M), !, four_legs(M).    % fact/rule order matters!
mammal3(M) :- has_tail(M), !, warm_blooded(M).
mammal4(M) :- warm_blooded(M), four_legs(M), !.
mammal5(M) :- has_tail(M), warm_blooded(M), !.

fetches(dog).
% get ALL mammals
mammals(Lst) :- findall(X, mammal0(X), Lst).
pet(X) :- fetches(X), mammals(Lst), member(X, Lst).

% change for a dollar
change(H, Q, D, N, P) :-
	member(N, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]),
	member(D, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]),
	member(Q, [0, 1, 2, 3, 4]),
	member(H, [0, 1, 2]),	
    S is ( (H * 50) + (Q * 25) + (D * 10) + (N * 5) ),
    S =< 100, 
	P is 100 - S.
	
