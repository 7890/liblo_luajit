#!/bin/sh
LD_LIBRARY_PATH=. luajit test_minimal.lua $@
