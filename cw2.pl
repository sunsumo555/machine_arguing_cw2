/*an argument is in the grounded extension if there is an argument in the grounded extension
defending it, or it is not attacked by any argument*/

argument(a).
argument(b).
argument(c).
argument(d).
argument(r).
argument(f).
argument(g).
argument(h).
attacks(a,h).
attacks(h,c).
attacks(a,b).
attacks(b,c).
attacks(c,d).
attacks(d,e).
attacks(f,e).
attacks(g,f).
attacks(g,g).

unattacked(X):-
	\+ attacks(_,X).
	
attack_set(X,[]):-
    attacks(X,_).
    
attack_set(X,[H|T]):-
    attacks(X,H),
    attack_set(X,T).
    
defends(X,Y):-
    findall(Z,attacks(Z,Y),L),
    attack_set(X,L).

grounded(X,Y):-
    unattacked(X).
    
grounded(X,Y):-
    defends(_Z,X),
    \+ _Z=X,
    \+ _Z=Y,
    grounded(_Z,X).
    
grounded(X):-
    unattacked(X).
 
grounded(X):-
    defends(_Z,X),
    \+ _Z=X,
    grounded(_Z,X).
