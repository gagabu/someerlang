-module(filters).
-export([even/1,old_men/1,filter/2,max/1,min/1,fold/3, filter2/2,map2/2,reverse/1]).


even(L) -> lists:reverse(even(L, [])).

even([], Acc) -> Acc;
even([H|T], Acc) when H rem 2 == 0 ->
	even(T, [H|Acc]);
even([_|T], Acc) -> 
	even(T, Acc).


old_men(L) -> lists:reverse(old_men(L, [])).

old_men([], Acc) -> Acc;
old_men([Person = {male,Age}|People], Acc) when Age > 60 ->
	old_men(People, [Person|Acc]);
old_men([_|People], Acc) ->
	old_men(People, Acc).


filter(Pred, L) -> lists:reverse(filter(Pred, L, [])).

filter(_, [], Acc) -> Acc;
filter(Pred, [H|T], Acc) ->
	case Pred(H) of
		true -> filter(Pred, T, [H|Acc]);
		false -> filter(Pred, T, Acc)
	end.


max([H|T]) -> max2(T, H).

max2([], Max) -> Max;
max2([H|T], Max) when H > Max -> 
	max2(T,H);
max2([_,T], Max) -> max2(T, Max).

min([H|T]) -> min2(T, H).

min2([], Min) -> Min;
min2([H|T], Min) when H < Min -> 
	min2(T,H);
min2([_,T], Min) -> min2(T, Min).

fold(_, Start, []) -> Start;
fold(F, Start, [H|T]) -> fold(F, F(H, Start), T).


reverse(L) -> 
	fold(fun(X,Acc) -> [X|Acc] end, [], L).

map2(F,L) ->
	reverse(fold(fun(X,Acc) -> [F(X)|Acc] end, [], L)).

filter2(Pred,L) ->
	reverse(fold(fun (X, Acc) -> case Pred(X) of true -> [X|Acc]; false -> Acc end end, [], L)).


