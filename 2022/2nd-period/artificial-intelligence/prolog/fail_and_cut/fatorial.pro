factorial(0, 1).
factorial(X, N):- X1 is X-1, factorial(X1, N1), N is X*N1.

factorial2(0, 1):-!.
factorial2(X, N):- X1 is X-1, factorial2(X1, N1), N is X*N1.
