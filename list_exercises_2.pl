%------------------------------------------
% LISTA DE EXERCÍCIOS 2
% Nicole Lima
%------------------------------------------

/**
 Exercício 1:
Qual é o resultado das seguintes consultas em Prolog?
?- forall(member(X,[1,2,3]),write(X)).*/
%   R: 123

/**
?- forall(between(1,5,I),(write(I*I),write(' '))). */
%   R: 1*1 2*2 3*3 4*4 5*5 

/**
?- forall(between(10,20,I),write(I:' ')).*/
%   R: 10: 11: 12: 13: 14: 15: 16: 17: 18: 19: 20: 

% OBS: o predicado "forall/2" imita um "for" quando usado com "between/3", seus parâmetros são forall(OCORRÊNCIAS,FAÇA).

/**
Exercício 2:
Considere o seguinte programa Prolog:

a:-a(0).
a(X):- X>10,!.
a(X):- write(X),write(' '), X1 is X+1,a(X1).

Qual será o resultado da seguinte consulta Prolog:
?- a. */
%   R: 0 1 2 3 4 5 6 7 8 9 10

/**
Exercício 3:
Faça um predicado que gere a pirâmide abaixo. Use o predicado wN/1.

wN(0):-write(0),!.
wN(N):-write(N),N1 is N-1, wN(N1),write(N).

Exemplo de uso:
?- xxx(3).
    0
   101
  21012
 3210123 */

wN(0):-write(0),!.
wN(N):-write(N), N1 is N-1, wN(N1), write(N).

wE(0) :- !.
wE(X) :- write(' '), X1 is X-1, wE(X1).

pyramid(X) :- forall(between(0,X,I),(X1 is X-I, wE(X1),wN(I),nl)).

/**
Exercício 4:
Usando um acumulador, e somente as operações (+)(-)(*), desenvolva um predicado
Prolog para calcular X elevado a Y. Assuma X e Y inteiros. */
pow(_,0,1) :- !.
pow(X,1,X) :- !.
pow(X,Y,Z) :- Y1 is Y-1, pow(X,Y1,Z1), Z is X * Z1.


/**
Exercício 5:
Dados os fatos:
d(0).
d(1).
Qual é o resultado da seguinte consulta Prolog:
?- findall([A,B],(d(A),d(B)),L).
d(0).
d(1).*/

% Encontre todas as formas possíveis de se escrever uma lista [A,B] com A e B variando entre 0 e 1.
%    R: L = [[0, 0], [0, 1], [1, 0], [1, 1]].
%
% OBS: O predicado "findall/2" gera uma lista com todas as alternativas possíveis que satisfaça uma consulta.

/**
Exercício 6:
Defina o predicado palindromo/1, que é verdadeiro se a lista é um palíndromo,
por exemplo, [a,b,c,d,c,b,a].*/

% ult/2 - Retorna o último elemento de uma lista
ult([X],X) :- !. 
ult([_|B],X) :- ult(B,X).

p([]) :- !.
p([_]) :- !.
p([Cabeca|Cauda]) :- 
    ult(Cauda, Ultimo),
    Ultimo = Cabeca, 
    append(L,[Ultimo],Cauda), % retira a cabeca e o último elemento da lista para comparar se o sua cauda é um palíndromo
    p(L), !.

% OBS: existem os predicados last/2 e head/2 em prolog
 
/**
Exercício 7:
Defina um predicado metIguais/1, que é verdadeiro se uma lista é formada por
duas metades iguais. Use o append. Seguem dois exemplos de uso.
?-metIguais([a,b,c, a,b,c]).
Yes
?-metIguais([a,b,c, a,b,d]).
No */

metIguais(Lista) :- append(Metade, Metade, Lista), !.

/**
Exercício 8:
Faça um predicado insOrd/3, que insere um elemento numa lista mantendo-a ordenada.
Faça duas regras: uma base e uma recursiva */

insOrd(X,[],[X]) :- !.
insOrd(X,[A|Z],[X|[A|Z]]) :- X < A, !.
insOrd(X,[A|Z],[A|L]) :- insOrd(X,Z,L).

% OBS: não encontrei uma maneira de se fazer com apenas 2 regras sem deixar de inserir ao início ou ao final.

/**
Exercício 9:
Faça um predicado que particiona/3 uma lista em duas, de tamanho igual se o número de
elementos for par, senão uma delas terá um elemento a mais. Tire dois elementos de uma
lista (se possível) e ponha cada um em uma lista resultado.*/

tam([],X) :- X is 0.
tam([_|B],X) :- tam(B,X1), X is X1+1.

particiona(L,L1,L2) :- 
    tam(L,T),
    T1 is T // 2, % T1 será a divisão inteira do tamanho T da lista L por 2, portanto, caso seja par, as listas terão mesmo tamanho
    tam(L1,T1), % L1 será uma lista vazia de tamanho T1
    append(L1,L2,L), !. 

/**
Exercício 10:
Faça o predicado merge/3, que junta duas listas ordenadas em uma terceira, mantendo a
ordem. Como segue:
?- merge([a,b,b,k,z], [c,m,n,o], X).
X=[a,b,b,c,k,m,n,o,z], yes */

% caso uma das listas esteja vazia
m2(A,[],A):- !.
m2([],A,A):- !.

% caso não tenha listas vazias
m2([A|R1],[B|R2],[A|R]) :- % a menor cabeça está na primeira lista, portanto, ela será a cabeça da nova lista
    A @=< B, % o '@' ao inicio do operador permite que ele compare caracteres
    m2(R1,[B|R2],R), !. % chamada recursiva com a cauda da primeira lista, a segunda lista inteira e a nova lista ainda desconhecida.

m2([A|R1],[B|R2],[B|R]) :-
    B @=< A,
    m2([A|R1],R2,R), !.

/**
Exercício 11:
O que está errado no programa abaixo? Rode-o com trace, para:
?- max(4,3,M) e
?- max(3,4,M) 
max(X, Y, M) :- !, X > Y, M = X.
max(X, Y, M) :- !, X <= Y, M = Y.
*/

max(X, Y, M) :- X > Y, M = X, !.
max(X, Y, M) :- X =< Y, M = Y, !.

% R: O corte '!', no início das condições, impossibilita o backtracking (procura de novas possibildades) caso a condição falhe
% e o operador '<=' não existe, sua forma correta é '=<'. 


/**
Exercício 12:
O que acontece com o predicado p, abaixo, quando o b é executado?
a. b. p:-!,a. p:-b. */
% R: O predicado p sempre será verdadeiro se a for verdadeiro, visto que sua primeira cláusula possui um corte '!' logo no início, e não tenterá outras possibilidades,
% porém, se b chegar a ser executado (ao mudar o corte da primeira cláusula de lugar), sendo verdadeiro ou falso, 
% p dará início ao backtracking já que sua cláusula com b não possui corte.


/**
Exercício 13:
Usando findall, defina e teste os predicados pred1/2, pred2/2 e pred3/2 que modificam
uma lista, conforme ilustrado nos seguintes exemplos:
?- pred1([a,b,c,d,e],L).
L = [[a],[b],[c],[d],[e]]
?- pred2([a,b,c,d,e],L).
L = [pred(a,a),pred(b,b),pred(c,c),pred(d,d),pred(e,e)]
?- pred3([a,b,c,d,e],L).
L = [[element,a],[element,b],[element,c],[element,d],[element,e]] */

% elem/2 - Retorna os elementos de uma lista individualmente de maneira recursiva
elem([A|_], A).
elem([_|B], X) :- elem(B,X). 

% pred1/2 - Modifica uma lista para uma lista de sublistas, onde cada elemento da lista original se torna uma sublista.
pred1(A,L) :- findall([X],(elem(A,X)),L).

% pred2/2 - Modifica uma lista para uma lista identidade, em que cada elemento é agrupado com ele mesmo na forma 'pred(x,x)'
pred2(A,L) :- findall(pred(X,X),elem(A,X),L).

% pred3/2 - Modifica uma lista para uma lista de sublistas, com cada elemento da sublista na forma '[element,x]'
pred3(A,L) :- findall([element,X],elem(A,X),L).

/**
Exercício 14:
Considere o seguinte problema: “Há dois jarros com capacidades de 3 e 4 litros,
respectivamente. Nenhum dos jarros contém qualquer medida ou escala, de modo que só
se pode saber o conteúdo exato quando eles estão cheios. Sabendo-se que podemos
encher ou esvaziar um jarro, bem como transferir água de um jarro para outro, encontre
uma sequência de passos que deixe o jarro de 4 litros com exatamente 2 litros de água”.
Considere que o estado inicial pode ser representado pela lista [0,0], indicando que os
jarros de 3 e 4 litros estão vazios inicialmente e a meta é [_,2]. Complete os predicados
transforma abaixo para descrever todas as transformações possíveis de estados desse
problema.
transforma('encher o jarro 1', [X,Y], [3,Y]) :- X < 3.
transforma('enchar o jarro 2', ...
transforma('esvaziar o jarro 1', ...
transforma('esvaziar o jarro 2', ...
transforma('transferir do jarro 1 para o 2', ...
transforma('transferir do jarro 2 para o 1', ...
%--- considerando que ainda restara agua no jarro de origem
transforma('transferir do jarro 1 para o 2', ...
transforma('transferir do jarro 2 para o 1', ... */

transforma('encher o jarro 1', [X,Y], [3,Y]) :- X < 3.
transforma('encher o jarro 2', [X,Y], [X,4]) :- Y < 4.
transforma('esvaziar o jarro 1', [X,Y], [0,Y]) :- X > 0.
transforma('esvaziar o jarro 2', [X,Y], [X,0]) :- Y > 0.
transforma('transferir do jarro 1 para o 2', [X,Y], [0,Y1]) :- X > 0, Y < 4, Y1 is X + Y, Y1 =< 4.
transforma('transferir do jarro 2 para o 1', [X,Y], [X1,0]) :- Y > 0, X < 3, X1 is X + Y, X1 =< 3.
%--- considerando que ainda restara agua no jarro de origem
transforma('transferir do jarro 1 para o 2', [X,Y], [X1,4]) :- X > 0, Y < 4, X + Y > 4, X1 is X + Y - 4.
transforma('transferir do jarro 2 para o 1', [X,Y], [3,Y1]) :- Y > 0, X < 3, X + Y > 3, Y1 is X + Y - 3.

