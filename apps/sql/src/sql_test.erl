%% @author: Dima
%% @date: 02.09.2019

-module(sql_test).

%% Include files

%% Exported Functions

-export([
    connect/0,
    insert/0,
    select/0
]).

%%%===================================================================
%%% API
%%%===================================================================


connect() ->
    {ok, C} = epgsql:connect("localhost", "postgres", "extloc", #{
        database => "test",
        timeout => 4000
    }).



insert() ->
    {ok, C} = connect(),
    epgsql:squery(C, "insert into test_schema.test_table (id, name) values  (1, '{Dima}'), (2, '{Max}')").



select() ->
    {ok, C} = connect(),
    epgsql:squery(C, "select * from test_schema.test_table"). 

%%%===================================================================
%%% Internal functions
%%%===================================================================





