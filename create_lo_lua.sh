#!/bin/bash

#//tb/170923
#derive bindings from lo.h, useful for luajit

#typical use: ./create_lo_lua.sh > lo.lua

#common filters
remove_comments="grep -v '^#'"
remove_empty_lines="grep -v '^\$'"
trim_leading_space="sed -e 's/^[[:space:]]*//'"
#"assemble" multi-line method declarations to one line
replace_newline_after_comma="sed -e ':a' -e 'N' -e '\$!ba' -e 's/,\n/, /g'"

###############################################################################
function check_tools
{

echo "looking for commands ...">&2
(which pkg-config && which sed && which cut && which gcc && which cat && which grep && which mktemp && which md5sum)>&2 \
	|| (echo "error: not all tools found.">&2; return 1)
ret=$?
if [ $ret -ne 0 ]
then
	exit 1
fi

}

###############################################################################
function find_lo_header
{

echo "finding lo header ...">&2
export PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
LO_HEADER_FILE="`pkg-config --cflags-only-I liblo | cut -d'I' -f2- | cut -d" " -f1`/lo/lo.h"
#LO_HEADER_FILE="/usr/include/lo/lo.h"

if [ ! -r "$LO_HEADER_FILE" ]
then
	echo "cannot read $LO_HEADER_FILE">&2
	exit 1
fi

}

###############################################################################
function create_lua_methods
{

tempfile="`mktemp`"

###to "break" anywhere in the pipe, insert this
#	> "$tempfile"
#...
#exit

echo "expanding lo header, transforming ...">&2
#use gcc preprocessor output, format one method per line, filter useful, format for lua

######	| grep -v "\[" \

gcc -E "$LO_HEADER_FILE" \
	| eval "$remove_empty_lines" \
	| eval "$trim_leading_space" \
	| eval "$remove_comments" \
	| eval "$replace_newline_after_comma" \
	| grep -v "\.\.\." \
	| grep -v "va_list " \
	| sed 's/;$//g' \
	| sed 's/*//g' \
	| sed 's/const //g' \
	| grep  -e "^lo_[a-Z0-9_]\{1,\} lo_" \
		-e "^void lo_" \
		-e "^char lo_" \
		-e "^int lo_" \
		-e "^int32_t lo_" \
		-e "^int64_t lo_" \
		-e "^uint32_t lo_" \
		-e "^uint64_t lo_" \
		-e "^float lo_" \
		-e "^double lo_" \
		-e "^size_t lo_" \
	| while read line; do
		#test for case void (no return)
		echo "$line"|grep "^void lo_" >/dev/null
		ret=$?
		if [ $ret -eq 0 ]
		then
			RETURN=""
		else
			RETURN="return"
		fi

		#test if there are args at all
		echo "$line"|grep "()" >/dev/null
		ret=$?
		if [ $ret -eq 0 ]
		then
			ARGS=""
		else
			ARGS="..."
		fi

		method="`echo \"$line\"|cut -d \" \" -f2-|cut -d \"_\" -f2-|cut -d \"(\" -f1`"
		echo "function lo:${method}(${ARGS}) ${RETURN} ffi.C.lo_${method}(${ARGS}) end"

		#add xxx_string variant for this method if it returns char*
		echo "$line"|grep "^char " >/dev/null
		ret=$?
		if [ $ret -eq 0 ]
		then
			echo "function lo:${method}_string(${ARGS}) ${RETURN} ffi.string(ffi.C.lo_${method}(${ARGS})) end"
		fi
	done

	rm -f "$tempfile"

}

###############################################################################
function output_header
{
CREATION_DATE="`date --utc`"
CREATION_DATE_EPOC="`date --utc +%s`"
LO_HEADER_MD5="`md5sum \"${LO_HEADER_FILE}\"`"

cat - << __EOF__
--osc.lua

--this file was generated with create_lo_lua.sh
--${CREATION_DATE}
--${CREATION_DATE_EPOC}
--${LO_HEADER_MD5}

local lo={}
--global
ffi=require("ffi")
--in ffi.C space
local liblo=ffi.load("lo",true)

ffi.cdef[[
//handy for "debugging" data types
int printf(const char *fmt, ...);
//handy for everything blob, (de-)serialise, ..
void *malloc(size_t size);
void free(void *ptr);
void *calloc(size_t nmemb, size_t size);
void *realloc(void *ptr, size_t size);
//following is expanded lo.h
__EOF__


##ev. add malloc, free, ...

##cat ./lo_preprocessed.h
gcc -E "$LO_HEADER_FILE" \
        | eval "$remove_empty_lines" \
        | eval "$remove_comments"

cat - << __EOF__
]]

--used in lo:send() method body, useful beyond lo:send()
--http://lua-users.org/wiki/SwitchStatement
function switch(n, ...)
	for _,v in ipairs {...} do
		if v[1] == n or v[1] == nil then
			return v[2]()
		end
	end
end
function case(n,f) return {n,f} end
function default(f) return {nil,f} end

--lo_* methods
__EOF__
}

###############################################################################
function output_footer
{
cat - << __EOF__

--lo_* method equivalents that are a macro in lo.h
--lo_* helper methods
--other convenience methods that are no part of liblo

--function lo:send(host,port,path,typestring,...)
function lo:send(address,path,typestring,...)
	local n = select('#', ...)
	local t = {...}
--	for i = 1,n do
--		print(t[i])
--	end

	local m=lo:message_new()

	local t_offset=0
	for i = 1, #typestring do
		local type=string.sub(typestring, i, i)
		switch( type,
			case( "i", function() lo:message_add_int32 (m,t[i-t_offset]) end),
			case( "f", function() lo:message_add_float (m,t[i-t_offset]) end),
			case( "s", function() lo:message_add_string(m,t[i-t_offset]) end),
			case( "h", function() lo:message_add_int64 (m,t[i-t_offset]) end),
			case( "d", function() lo:message_add_double(m,t[i-t_offset]) end),
			case( "c", function() lo:message_add_char(m,t[i-t_offset]) end),
			case( "S", function() lo:message_add_symbol(m,t[i-t_offset]) end),
			case( "b", function() lo:message_add_blob(m,t[i-t_offset]) end),
			case( "m", function() lo:message_add_midi(m,t[i-t_offset]) end),
			case( "t", function() lo:message_add_timetag(m,t[i-t_offset]) end),

			case( "T", function() lo:message_add_true(m) t_offset=t_offset+1 end),
			case( "F", function() lo:message_add_false(m) t_offset=t_offset+1 end),
			case( "N", function() lo:message_add_nil(m) t_offset=t_offset+1 end),
			case( "I", function() lo:message_add_infinitum(m) t_offset=t_offset+1 end),

			--///ignore
			case( "[", function() t_offset=t_offset+1 end),
			case( "]", function() t_offset=t_offset+1 end),
			--case( "r", function() end),

			default( function() print("unknown OSC type: " .. type) return 1 end)
		)
	end

	--local address=lo:address_new(host,port)
	local r=lo:send_message(address,path,m)
	--lo:address_free(address)
	lo:message_free(m)
end

function lo:version_helper()
	local verstr_size=128
	local extra_size=128
	local verstr = ffi.new("uint8_t[?]", verstr_size)
	local extra = ffi.new("uint8_t[?]", extra_size)

	--http://luajit.org/ext_ffi_tutorial.html
	--In C you'd pass in the address of a local variable (&buflen). But since there's no address-of operator in Lua, we'll just pass in a one-element array.
	major=ffi.new("int[1]")
	minor=ffi.new("int[1]")
	lt_major=ffi.new("int[1]")
	lt_minor=ffi.new("int[1]")
	lt_bug=ffi.new("int[1]")

	lo:version(verstr, verstr_size, major, minor, extra, extra_size, lt_major, lt_minor, lt_bug)

	return ffi.string(verstr), tonumber(major[0]), tonumber(minor[0]),
		ffi.string(extra), tonumber(lt_major[0]), tonumber(lt_minor[0]), tonumber(lt_bug[0])
end

function lo:malloc_gc(len)
	--eventually garbage collect malloced buffer using C.free after buffer was nil'ed
	return ffi.gc(ffi.C.malloc(ffi.cast("size_t",len)), ffi.C.free)
end

--uncomment the following line if lo.lua should be totally quiet
print("osc.lua loaded. using liblo version: " .. lo:version_helper())
return lo

--EOF
__EOF__
}

###############################################################################
function create_lo_lua
{
	check_tools
	find_lo_header
	output_header
	create_lua_methods
	output_footer
}

###############################################################################
###############################################################################
create_lo_lua

echo "done.">&2

exit

###############################################################################
# http://opensoundcontrol.org/spec-1_0
# OSC Type Tag 	Type of corresponding argument
# h 	64 bit big-endian two's complement integer
# t 	OSC-timetag
# d 	64 bit ("double") IEEE 754 floating point number
# S 	Alternate type represented as an OSC-string (for example, for systems that differentiate "symbols" from "strings")
# c 	an ascii character, sent as 32 bits
# r 	32 bit RGBA color
# m 	4 byte MIDI message. Bytes from MSB to LSB are: port id, status byte, data1, data2
# T 	True. No bytes are allocated in the argument data.
# F 	False. No bytes are allocated in the argument data.
# N 	Nil. No bytes are allocated in the argument data.
# I 	Infinitum. No bytes are allocated in the argument data.
# [ 	Indicates the beginning of an array. The tags following are for data in the Array until a close brace tag is reached.
# ] 	Indicates the end of an array.
###############################################################################

#EOF
