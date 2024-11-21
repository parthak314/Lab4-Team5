rm -rf obj_dir
verilator -Wall --cc --trace pc_top.sv pc_register.sv mux.sv adder.sv --exe ../tb/tests/pc_top_tbb.cpp
make -j -C obj_dir/ -f Vpc_top.mk Vpc_top
obj_dir/Vpc_top