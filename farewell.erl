-module(farewell).
-export([start/1]).

start(File) ->
    {ok, Content} = file:read_file(File),
    Decrypted = re:split(re:replace(Content, "[\n\r\t ]", "", [{return,list},global]), ",", [{return,list}]),
    io:fwrite(Decrypted).
