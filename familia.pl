% fatos ----------------------------------------

% 1ª geração
pai(edmundo,jose).
pai(edmundo,joao).
pai(edmundo,aurora).

pai(valdecir,pedro).


% 2ª geração
pai(jose,borin).

pai(joao,ryan).
pai(joao,barbara).

pai(pedro,isabela).
pai(pedro,caroline).


% 3ª geração
pai(francelino,bonardi).
pai(francelino,vinicius).

pai(felipe,maria).
pai(felipe,giovana).

% --------------------------------

% 1ª geração
mae(lurdes,jose).
mae(lurdes,joao).
mae(lurdes,aurora).

mae(mariane,pedro).


% 2ª geração
mae(camila,borin).

mae(assucena,ryan).
mae(assucena,barbara).

mae(aurora,isabela).
mae(aurora,caroline).


% 3ª geração
mae(isabela,bonardi).
mae(isabela,vinicius).

mae(caroline,maria).
mae(caroline,giovana).


% regras --------------------------------------

avo(X,Y) :- pai(Z,Y), pai(X,Z).
avo(X,Y) :- pai(Z,Y), mae(X,Z).
avo(X,Y) :- mae(Z,Y), mae(X,Z).
avo(X,Y) :- mae(Z,Y), pai(X,Z).

neto(X,Y) :- avo(Y,X).

bisavo(X,Y) :- avo(Z,Y), pai(X,Z).
bisavo(X,Y) :- avo(Z,Y), mae(X,Z).

irmao(X,Y) :- pai(Z,Y), pai(Z,X), mae(M,Y), mae(M,X), X\=Y.

primo(X,Y) :- pai(Z,X), pai(S,Y), irmao(Z,S).
primo(X,Y) :- mae(Z,X), mae(S,Y), irmao(Z,S).
primo(X,Y) :- mae(Z,X), pai(S,Y), irmao(Z,S).
primo(X,Y) :- pai(Z,X), mae(S,Y), irmao(Z,S).

casal(X,Y) :- pai(X,Z), mae(Y,Z), !.
casal(X,Y) :- mae(X,Z), pai(Y,Z), !.

tio(X,Y) :- pai(Z,Y), irmao(Z,X).
tio(X,Y) :- mae(Z,Y), irmao(Z,X).
tio(X,Y) :- pai(Z,Y), irmao(I,Z), casal(I,X).
tio(X,Y) :- mae(Z,Y), irmao(I,Z), casal(I,X).
