#!/bin/bash

# Translate Verilog -> C++ including testbench
verilator -Wall --trace \
          -cc signext.sv \
          --exe signext_test.cpp \
          -o Vsignext \
          -LDFLAGS "-lgtest -lgtest_main -lpthread"

# Build C++ project with automatically generated Makefile
make -j -C obj_dir/ -f Vsignext.mk

# Run executable simulation file
./obj_dir/Vsignext
