%% @author: Dima
%% @date: 02.09.2019

-module(q).

%% Include files

%% Exported Functions

-export([
    test/0
]).

%%%===================================================================
%%% API
%%%===================================================================


test() ->
    Pid = spawn(fun loop/0),
    timer:sleep(1000),
    Pid ! {set, 1, <<"test">>},
    timer:sleep(1000),
    erlang:process_info(Pid, dictionary).


loop() ->
    put(<<"my_key">>, <<"my_value">>),
    receive
        {set, Key, Value} ->
            put(Key, Value),
            loop()
    end.



%%%===================================================================
%%% Internal functions
%%%===================================================================





