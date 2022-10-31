substitute(X, Y, [], []).
substitute(X, Y, [X|T], [Y|T1]) :- substitute(X, Y, T, T1).
% case for -X \= H
substitute(X, Y, [H|T], [H|T1]) :- -X \= H, substitute(X, Y, T, T1).