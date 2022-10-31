% Quicksort in prolog

quickSort([],[]). quickSort([H|T],S) :- partition(H,T,L1,L2), quickSort(L1,S1), quickSort(L2,S2), append(S1,[H|S2],S). partition(_,[],[],[]). partition(H,[X|T],[X|L],G) :- X =< H, partition(H,T,L,G). partition(H,[X|T],L,[X|G]) :- X > H, partition(H,T,L,G).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%% %%% The following code is from the book "Artificial Intelligence: A Modern Approach" %%% by Stuart Russell and Peter Norvig. %%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
