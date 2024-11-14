#include <iostream>
#include "verilated.h"
#include "verilated_vcd_c.h"
#include "Vpc_top.h"

int main(int argc, char **argv, char **env)
{
    int simcyc;
    int tick;

    Verilated::commandArgs(argc, argv);
    Vpc_top *top = new Vpc_top;
    Verilated::traceEverOn(true);
    VerilatedVcdC *tfp = new VerilatedVcdC;
    top->trace(tfp, 99);
    tfp->open("pc_tbb_waveform.vcd");

    top->clk = 1;
    top->rst = 0;
    top->PCsrc = 0;
    top->ImmOp = 10;

    for (simcyc = 0; simcyc < 100; simcyc++)
    {
        for (tick = 0; tick < 2; tick++)
        {
            tfp->dump(2 * simcyc + tick);
            top->clk = !top->clk;
            top->eval();
        }

        top->rst = (simcyc < 3);    // test regular 4 byte increment
        top->PCsrc = (simcyc > 50); // test branch with ImmOp = 12
        
        std::cout << "current PC: " << top->PC << std::endl;

        if (Verilated::gotFinish())
            exit(0);
    }

    tfp->close();
    exit(0);
}