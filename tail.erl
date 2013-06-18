-module(tail).
-export([tail_fac/1,tail_len/1,duplicate/2,tail_duplicate/2,reverse/1,tail_reverse/1]).


tail_fac(N) -> tail_fac(N, 1).

tail_fac(0, Acc) -> Acc;
tail_fac(N, Acc) when N > 0 -> tail_fac(N-1, N * Acc).


tail_len(L) -> tail_len(L, 0).

tail_len([], Acc) -> Acc;
tail_len([_|T], Acc) -> tail_len(T, Acc + 1).

duplicate(0, _) -> [];
duplicate(N, Term) -> [Term|duplicate(N-1,Term)].


tail_duplicate(N,Term) -> tail_duplicate(N, Term, []).
tail_duplicate(0,_,List) -> List;
tail_duplicate(N,Term,List) -> tail_duplicate(N-1,Term,[Term|List]).


reverse([]) -> [];
reverse([H|T]) -> reverse(T)++[H].


tail_reverse(L) -> tail_reverse(L, []).

tail_reverse([], Acc) -> Acc;
tail_reverse([H|T], Acc) -> tail_reverse(T,[H|Acc]).
