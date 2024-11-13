#pragma once

#include "Vdut.h"
#include "verilated.h"
#include "verilated_vcd_c.h"
#include "gtest/gtest.h"

#define MAX_SIM_CYCLES 10000

extern Vdut *top;
extern VerilatedVcdC *tfp;
extern unsigned int ticks;

class BaseTestbench : public ::testing::Test
{
public:
    virtual void SetUp() override
    {
        initializeInputs();
    }

    void TearDown() override
    {
    }

    virtual void initializeInputs() = 0;
};