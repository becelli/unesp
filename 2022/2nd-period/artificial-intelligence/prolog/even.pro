% verify if number is even in prolog
is_even(X) :- 0 is X mod 2.
is_odd(X) :- not(is_even(X)).
