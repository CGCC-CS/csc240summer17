% tail recursion
fib-tail(N, F) :- fib-tail(N, 1, 1, F), !.
fib-tail(1, F2, _, F2) :- !.
fib-tail(N, F2, F1, F) :- N1 is N - 1, F0 is F1 + F2, 
	                      fib-tail(N1, F1, F0, F).

% change for a dollar
change(H, Q, D, N, P) :-
    member(N, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]),
	member(D, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]),
	member(Q, [0, 1, 2, 3, 4]),
	member(H, [0, 1, 2]),
	S is ( (H * 50) + (Q * 25) + (D * 10) + (N * 5) ),
	S =< 100,
	P is 100 - S.

% cut
warm_blooded(chicken).
warm_blooded(cat).
warm_blooded(dog).
four_legs(cat).
four_legs(dog).
two_legs(chicken).
fetches(dog).
fetches(chicken).

mammal0(M) :- warm_blooded(M), four_legs(M).
mammal1(M) :- !, warm_blooded(M), four_legs(M).
mammal1(godzilla).
mammal2(M) :- warm_blooded(M), !, four_legs(M).
mammal3(M) :- warm_blooded(M), four_legs(M), !.


