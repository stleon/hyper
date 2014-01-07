-module(hyper_array).
-export([new/1, get/2, set/3, fold/3]).
-behaviour(hyper_register).

new(P) ->
    M = trunc(math:pow(2, P)),
    array:new([{size, M}, {fixed, true}, {default, 0}]).

get(Index, A) ->
    case array:get(Index, A) of
        0 ->
            undefined;
        Value ->
            {ok, Value}
    end.


set(Index, Value, A) ->
    array:set(Index, Value, A).



fold(F, Acc, A) ->
    array:sparse_foldl(F, Acc, A).
