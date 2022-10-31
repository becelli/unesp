student(anne).
student(william).
student(therese).
student(philip).

% write_all :-
%     tell('students.txt'),
%     forall(student(X), write(X)), nl,
%     told.

write_all :- student(X), write(X), nl, fail.