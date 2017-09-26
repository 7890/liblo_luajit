lo=require("lo")
td=require("test_data")

--defaults
to_host         ="localhost"
to_port         ="9999"
path            ="/hello/world"
--override defaults from command line arguments if any
local argc = select('#', ...)
local argv = {...}
if argc >= 3 then path=argv[3] end
if argc >= 2 then to_port=argv[2] end
if argc >= 1 then to_host=argv[1] end

m=lo:message_new()

lo:message_add_int32(m,td.int32_min)
lo:message_add_int32(m,td.int32_max)
lo:message_add_int64(m,td.int64_min)
lo:message_add_int64(m,td.int64_max)
lo:message_add_float(m,td.float_max)
lo:message_add_float(m,-td.float_max)
lo:message_add_float(m,td.float_smallest)
lo:message_add_double(m,td.double_max)
lo:message_add_double(m,-td.double_max)
lo:message_add_double(m,td.double_smallest)
lo:message_add_string(m,td.empty_string)
lo:message_add_string(m,td.utf8_string)
lo:message_add_char(m,td.char)
lo:message_add_symbol(m,"sym")
--types that don't need a separate value
lo:message_add_true(m)
lo:message_add_false(m)
lo:message_add_nil(m)
lo:message_add_infinitum(m)
--append more
lo:message_add_blob(m,td.blob)
lo:message_add_midi(m,td.midi_data)
lo:message_add_timetag(m,td.tt_now)

a=lo:address_new(to_host,to_port)

print("sending message " .. path .. " " .. lo:message_get_types_string(m) .. " to " .. to_host .. ":" .. to_port)
r=lo:send_message(a,path,m)
print("message sent, return was " .. r)
if r<0 then return 1 end

print("sending again with lo:send()")
r=lo:send(a,path,lo:message_get_types_string(m)
	,td.int32_min
	,td.int32_max
	,td.int64_min
	,td.int64_max
	,td.float_max
	,-td.float_max
	,td.float_smallest
	,td.double_max
	,-td.double_max
	,td.double_smallest
	,td.empty_string
	,td.utf8_string
	,td.char
	,"sym"
	--types that ARE the value (no separate argument needed)
	--true(m)
	--false(m)
	--nil(m)
	--infinitum(m)
	,td.blob
	,td.midi_data
	,td.tt_now
)

print("sending message with [] and unknown types")
r=lo:send(a,path,"qir[ff]i",nil,1,nil,.2,.3,4)

print("cleaning up")
lo:address_free(a)
lo:message_free(m)

lo:blob_free(td.blob)
td.buffer=nil

print("done")
--eof
