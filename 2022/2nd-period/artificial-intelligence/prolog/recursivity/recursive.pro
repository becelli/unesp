% Relação de X PERTENCER à lista.
in(X, [X|_]).
in(X, [_|T]) :- in(X, T).

% ?- in(1, [1,2,3]).
%  true.

last(X, [X]).
last(X, [_|T]) :- last(X, T).
% ?- last(X, [1,2,3]).
% X = 3.

first(X, [X|_]).
% ?- first(X, [1,2,3]).
% X = 1.

consecutive(X, Y, [X, Y|_]).
consecutive(X, Y, [_|T]) :- consecutive(X, Y, T).
% ?- consecutive(1, 2, [1,2,3]).
%  true.

% ?- consecutive(1, 2, [1,3,2]).
%  false.

count(0, []).
count(N, [_|T]) :- count(N1, T), N is N1 + 1.
% ?- count(N, [1,2,3]).
% N = 3.
% ?- count(N, []).
% N = 0.




nth(1, E, [E|_]).
nth(N, E, [_|T]) :- nth(N1, E, T), N is N1 + 1.
% ?- nth(2, E, [1,2,3]).
% E = 2.

% ?- nth(2, 2, [1,2,3]).
%  true.

remove_list(X, [X|T], T).
remove_list(X, [H|T], [H|T1]) :- remove_list(X, T, T1).
% ?- remove_list(2, [1,2,3], L).
% L = [1,3].

insert_head(X, L, [X|L]).
% ?- insert_head(0, [1,2,3], L).
% L = [0,1,2,3].

insert_tail(X, [], [X]).
insert_tail(X, [H|T], [H|T1]) :- insert_tail(X, T, T1).
% ?- insert_tail(4, [1,2,3], L).
% L = [1,2,3,4].

insert_nth(X, 1, L, [X|L]).
insert_nth(X, N, [H|T], [H|T1]) :- N1 is N - 1, insert_nth(X, N1, T, T1).
% ?- insert_nth(0, 2, [1,2,3], L).
% L = [1,0,2,3].



% duplicate elements [1,2,3] -> [1,1,2,2,3,3]
duplicate([], []).
duplicate([H|T], [H,H|T1]) :- duplicate(T, T1).
% ?- duplicate([1,2,3], L).
% L = [1,1,2,2,3,3].


% Verify if an element is in the list, and its position if yes.
in_list(X, [X|_], 1).
in_list(X, [_|T], N) :- in_list(X, T, N1), N is N1 + 1.
% ?- in_list(2, [1,2,3], N).
% N = 2.

% ?- in_list(4, [1,2,3], N).
% false.

concat([], L, L).
concat([H|T], L, [H|T1]) :- concat(T, L, T1).
% % ?- concat([1,2], [3,4], L).
% % L = [1,2,3,4].

% Invert a list.
invert([], []).
invert([H|T], L) :- invert(T, L1), concat(L1, [H], L).
% ?- invert([1,2,3], L).
% L = [3,2,1].

% factorial
factorial(0, 1).
factorial(N, F) :- M is N - 1, factorial(M, K), F is N * K.
% ?- factorial(5, F).
% F = 120.

% has the same elements, but in different order or ordinality.
% ?- same_elements([1,2,3], [3,2,1]).
%  true.

% ?- same_elements([1,2,3], [3,2,1,2]).
%  true.

contain([], _).
contain([H|T], L) :- in(H, L), contain(T, L).

equal([], []).
equal(L1, L2) :- contain(L1, L2), contain(L2, L1).

abs_list([], []).
abs_list([H|T], [H1|T1]) :- abs(H, H1), abs_list(T, T1).
% ?- abs_list([-1,2,-3], L).
% L = [1,2,3].

loop_desc(0).
loop_desc(N) :- N > 0, write(N), nl, N1 is N - 1, loop_desc(N1).
% ?- loop_desc(3).
% 3
% 2
% 1

loop_asc(0).
loop_asc(N) :- N > 0, N1 is N - 1, loop_asc(N1), write(N), nl.
% ?- loop_asc(3).
% 1
% 2
% 3