# liblo_luajit
using liblo with luajit

https://github.com/radarsat1/liblo/

https://github.com/LuaJIT/LuaJIT/

```
oscdump 9999 &
OPID=$!
git clone https://github.com/7890/liblo_luajit && cd liblo_luajit && ./create_lo_lua.sh > lo.lua && ./test_send_message.lua.sh
kill -9 $OPID
```
