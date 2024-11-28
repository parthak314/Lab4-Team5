verilator -Wall --trace -cc ../rtl/top.sv --exe ./tests/verify.cpp -y ../rtl/ --prefix "Vdut" -o Vdut -LDFLAGS "-lgtest -lgtest_main -lpthread"
make -j -C obj_dir/ -f Vdut.mk
./obj_dir/Vdut
