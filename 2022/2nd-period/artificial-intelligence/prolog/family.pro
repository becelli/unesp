pai(joao, pedro).
pai(joao, manoel).
pai(pedro,lucas).
pai(pedro, marcio).
pai(manoel, luiz).
pai(manoel, andre).
pai(marcio, gabriel).
pai(andre, carlos).

avo(X, Y) :- pai(X, W), pai(W, Y).
irmao(X, Y) :- pai(W, X), pai(W, Y), X \= Y. 
tio(X, Y) :- irmao(X, W), pai(W, Y).
sobrinho(X, Y) :- tio(Y, X).
