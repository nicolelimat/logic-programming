sudoku(S) :- resolve(S), mostraSolucao(S).

resolve(S) :- 
    resolveLinhas(S),
    resolveColunas(S),
    resolveQuadros(S).

resolveLinhas([]) :- !.
resolveLinhas([A|B]) :- diferente(A), resolveLinhas(B).

resolveColunas([[],[],[],[]]) :- !.
resolveColunas([[A|A1],[B|B1],[C|C1],[D|D1]]) :- diferente([A,B,C,D]), resolveColunas([A1,B1,C1,D1]).

resolveQuadros([[A1,A2,B1,B2],[A3,A4,B3,B4],[C1,C2,D1,D2],[C3,C4,D3,D4]]) :- diferente([A1,A2,A3,A4]),diferente([B1,B2,B3,B4]),diferente([C1,C2,C3,C4]),diferente([D1,D2,D3,D4]).

diferente([A, B, C, D]) :- 
   num(A), num(B), num(C), num(D), 
   A\=B, A\=C, A\=D, B\=C, B\=D, C\=D.

num(1).
num(2).
num(3).
num(4).

mostraSolucao([]):- !.
mostraSolucao([A|B]) :- 
    mostraLinha(A), nl, mostraSolucao(B).

mostraLinha([]) :- !.
mostraLinha([A|B]) :- 
    write(A), write(' '), mostraLinha(B).

