DOMAINS
apa,nama = symbol

PREDICATES
nondeterm menyukai(nama, apa)
suka


CLAUSES
menyukai(novel,music).

suka:-
menyukai(X,Y),
write(X," senang ",Y,"\n"),

fail.
suka.

GOAL
suka.