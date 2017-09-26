#!/bin/sh
LD_LIBRARY_PATH=. luajit test_send_message.lua $@
