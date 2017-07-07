father(jobal, padme).
father(anakin, luke).
father(anakin, leia).
father(han, ben).
mother(shmi, anakin).
mother(ruwee, padme).
mother(padme, luke).
mother(padme, leia).
mother(leia, ben).

same(X,X).

male(luke).
male(john).
male(bob).
male(mike).
female(sarah).
weather(tempe, summer, hot).
weather(tempe, winter, warm).
weather(tempe, fall, hot).
president(lincoln).
president(kennedy).
president(bush).
president(bob).
president(X) :- member(X,[washington, adams, jefferson]).

score(tb, 4).
score(bos, 1).
won(X) :- score(X, ScoreX), score(Y, ScoreY), X \= Y, ScoreX >= ScoreY.

happy(bob).
happy(alice).
talkative(bob).

annoying(jarjar).
annoying(X) :- happy(X), talkative(X).


% robot AI
badguy(darthvader).          % badguy/1
badguy(darthmaul).
badguy(kyloren).
badguy(batman, twoface).     % badguy/2
badguy(batman, joker).
badguy(superman, lexluthor).
fight(X) :- badguy(X).
fight(X) :- badguy(_Superhero, X).
% poor bob
fight(X) :- annoying(X).

%write output when file is consulted
:- badguy(superman, X), write(['Superman has defeated ', X]), nl.

% equation A + B = C
equation(A, B, C) :- 
	same(Integer, [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]),
	member(A, Integer),
	member(B, Integer),
	C is A + B.





