# liblo_luajit
using liblo with luajit

https://github.com/radarsat1/liblo/

https://github.com/LuaJIT/LuaJIT/

```
git clone https://github.com/7890/liblo_luajit && cd liblo_luajit && ./create_lo_lua.sh > lo.lua

#just trying to require "lo"
./test_minimal.lua.sh

oscdump 9999 &
OPID=$!
#sending a message with all known types included
./test_send_message.lua.sh localhost 9999 /test
kill -9 $OPID

#starting a server thread with two handlers playing ping pong
./test_server.lua.sh 9999

```
