-module(exceptions).
-compile(export_all).

throws(F) ->
	try F() of
		_ -> ok
	catch 
		Throw -> {throw, caught, Throw}
	end.


catcher(X,Y) ->
	case catch X/Y of 
		{'EXIT', {badarith, _}} -> "uh oh";
		N -> N
	end.

