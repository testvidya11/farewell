-module(farewell).
-export([start/1]).

start(File) ->
    {ok, Content} = file:read_file(File),
    io:fwrite(Content).
