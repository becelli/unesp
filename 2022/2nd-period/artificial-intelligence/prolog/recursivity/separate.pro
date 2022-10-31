% return X in the first list if X is even, otherwise return X in the second list
is_even(X) :- 0 is X mod 2.

% separate even and odd numbers in two different lists
separate([], [], []).
separate([H|T], T1, [H|T2]) :- is_even(H), separate(T, T1, T2).
separate([H|T], [H|T1], T2) :- not(is_even(H)), separate(T, T1, T2).


even_numbers([], []).
even_numbers([H|T], [H|T1]) :- is_even(H), even_numbers(T, T1).
even_numbers([H|T], T1) :- not(is_even(H)), even_numbers(T, T1).