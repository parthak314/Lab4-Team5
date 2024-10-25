#pragma once

#include "base_testbench.h"

/**
 * Class only exists because top->clk is not always accessible in the testbench,
 * and will otherwise not compile.
 */
class Testbench : public BaseTestbench
{
public:
    // Runs the simulation for a clock cycle, evaluates the DUT, dumps waveform.
    void runSimulation(int cycles)
    {
        for (int i = 0; i < cycles; i++)
        {
            for (int clk = 0; clk < 2; clk++)
            {
                top->eval();
                tfp->dump(2 * ticks + clk);
                top->clk = !top->clk;
            }
            ticks++;

            if (Verilated::gotFinish())
            {
                exit(0);
            }
        }
    }
};