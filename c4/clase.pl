famoso(pedro).
famoso(juan).
hombre(juan).
hombre(simon).
hombre(roberto).
hombre(pedro).

feliz(X) :- hombre(X), write(X), famoso(X), write(X).
/*Es feliz si es hombre y famoso, por ejemplo juan es feliz (true) pero simon no porque solo es hombre (false)*/


/*Padre de Juan*/
padre(pedro, juan).
padre(roberto, pedro).
padre(simon, roberto).
padre(manuel, simon).
padre(manuel, doroteo).


/*Recursividad 
ancestro(X, Y):- padre(X, Z),  write(Z), ancenstro(Y, Z). */

/* Case base !cut*/
ancestro(X, Y):- padre(X,Y), write(X), !.

/* Busca una z para cual x sea su papa y lo sustituye en la z de ancestro*/
ancestro(X, Y):- padre(X, Z),  ancestro(Z, Y).

ancestro(X, Y):- padre(X,Y).
ancestro(X, Y):- padre(X, Z),  ancestro(Z, Y).


/*** Lista ****/

/* X backtracking (Guardar resultado)*/
elementoLista([], Cont, Cont).
/* _ para evitar singleton (varaibles que no se ocupan) poner _ */
elementoLista([_|T], Cont, X) :- Z is Cont + 1, elementosLista(T, Z, X).
cuenta(Lista, X):- elementosLista(Lista, 0, X).
elementosLista([1,2,3,4,5], 0, X).

/* Comparaci{on de dos listas */
sameList([],[]).
sameList([H|T],[H1|T1]):-H=:=h1, samelist(T, T1).



/*Funcion append en una lista*/
split(A, X, Y) :- append(X, Y, A), length(X, A), length(Y, B), A =:=B, !.

/*Maximo de una lista*/
arrLista([], A, B) :- A is B
arrLista([H|T], A, B) :- H > A, arrLista(T, H, B)
arrLista([H|T],A, B):- H =< A, arrLista(T, A, B)




