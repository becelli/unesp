% path(a, e, 110).
% path(a, b, 220).
% path(b, c, 430).
% path(c, d, 50).
% path(e, c, 80).
% path(e, d, 90).
% can_go(X, X, 0, [X]).
% can_go(Begin, End, Distance, [Begin|Visited]) :- path(Begin, Adjacent, D1), can_go(Adjacent, End, D2, Visited), Distance is D1 + D2.
path(a, b, 220).
path(a, e, 110).
path(b, c, 430).
path(c, d, 50).
path(e, c, 80).
path(e, d, 90).

% a e d = 
% a b c d

can_go(X, X, 0).
can_go(Begin, End, Distance) :- path(Begin, Adjacent, D1), can_go(Adjacent, End, D2), Distance is D1 + D2.