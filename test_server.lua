lo=require("lo")

--default
port="9999"
--eventually read port from command line args
local argc = select('#', ...)
local argv = {...}
if argc >= 1 then port=argv[1] end

error_handler=ffi.cast("lo_err_handler",function(num,reason,path)
	if not(path==nil) then
		print("server error: " .. num .. " in path " .. ffi.string(path)  .. ": " .. ffi.string(reason))
	else
		print("server error: " .. num .. ": " .. ffi.string(reason))
	end
end)

ping_handler=ffi.cast("lo_method_handler",function(path,types,argv,argc,msg,user_data)
	print("ping " .. argv[0].i)
	local a=lo:message_get_source(msg)
--	print(lo:address_get_hostname_string(a) 
--		.. ":" .. lo:address_get_port_string(a)
--		.. " " .. ffi.string(path) 
--		.. " " .. ffi.string(types)
--		.. " (" .. argc .. ")"
--		.. " " .. argv[0].i
--		------------------------------notice: not argv[1].s
--		.. " \"" .. ffi.string(ffi.cast("char *", argv[1])) .. "\""
--		.. " " .. argv[2].f
--	)
--	print(lo:arg_pp(types[0],argv[0]))
	local m=lo:message_new()
	lo:message_add_int64(m,argv[0].h)
	lo:message_add_string(m,ffi.cast("char *", argv[1]))
	lo:message_add_float(m,argv[2].f)
	lo:send_message(a,"/pong",m)
	lo:message_free(m)
	return 0
end)

pong_handler=ffi.cast("lo_method_handler",function(path,types,argv,argc,msg,user_data)
	print("pong " .. argv[0].i)
	local a=lo:message_get_source(msg)
	local m=lo:message_new()
	lo:message_add_int64(m,argv[0].h+1)
	lo:message_add_string(m,ffi.cast("char *", argv[1]))
	lo:message_add_float(m,argv[2].f)
	lo:send_message(a,"/ping",m)
	lo:message_free(m)
	return 0
end)

st=lo:server_thread_new(port,error_handler)
if (st==nil) then
	print ("could not create server on port " .. port .. ". server already running?")
	return 1
end
print("server started on port " .. port);

lo:server_thread_add_method(st,"/ping","hsf",ping_handler,nil)
lo:server_thread_add_method(st,"/pong","hsf",pong_handler,nil)

print("hit enter to start ping pong, enter again to stop.")
io.read()

--send to self, start ping/ping
lo:send(lo:address_new("localhost",port),"/ping","isf",1,"a b c d € f g",0.3)

lo:server_thread_start(st)

print("server running on port " .. port .. ". press any key to quit.")
io.read()

--something goes wrong here
print("cleaning up")
lo:server_thread_del_method(st, "/ping", "hsf")
lo:server_thread_del_method(st, "/pong", "hsf")
lo:server_thread_stop(st)
lo:server_thread_free(st)

print("done")
--eof
