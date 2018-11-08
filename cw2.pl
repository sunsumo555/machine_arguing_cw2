/*an argument is in the grounded extension if there is an argument in the grounded extension
defending it, or it is not attacked by any argument*/

unattacked(X):-
	\+ attacks(_,X).

grounded(X):-
    unattacked(X).
	
grounded(X):-
	attacks(_attacker,X),
	attacks(_defender,_attacker),
	\+ _defender == X,
	grounded(_defender).
