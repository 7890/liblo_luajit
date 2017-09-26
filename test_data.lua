--test_data.lua
--re-use data for lo.lua tests

lo=require("lo")

local td={}
--configure
td.blob_size=40

td.int32_min= -2147483648
td.int32_max=  2147483647

--notice LL. For Lua all numbers are doubles if not indicated otherwise.
td.int64_min= -9223372036854775808LL
td.int64_max=  9223372036854775807LL

td.float_max=3.40282e+38
td.float_smallest=1.1755e-38

td.double_max=1.79769e+308
td.double_smallest=2.2251e-308

--ffi.C.printf("%.100f\n",float_min)
--ffi.C.printf("%g\n",td.float_max)
--ffi.C.printf("%g\n",td.float_smallest)
--ffi.C.printf("%g\n",td.double_max)
--ffi.C.printf("%g\n",td.double_smallest)

td.empty_string=""
td.utf8_string="abc /à\\b_c!d?€.☕"

td.char=string.byte("x")

--garbage collected after set to nil
td.buffer=lo:malloc_gc(td.blob_size)
td.blob=lo:blob_new(td.blob_size,td.buffer)

td.midi_data=ffi.new("uint8_t[4]", string.char(0xff, 0xf7, 0xAA, 0x00))

td.tt_now=ffi.new("lo_timetag")
lo:timetag_now(td.tt_now)

return td
--eof
