aluno(pedro, notas(6, 4)).
aluno(maria, notas(5, 9)).
aluno(ana, notas(3, 4)).
aluno(luiz, notas(9, 0)).
aluno(jose, notas(5, 5)).

media(X, Y) :- aluno(X, notas(A, B)), Y is (A+B)/2.
esta_aprovado(X) :- media(X, Y), Y >= 5.