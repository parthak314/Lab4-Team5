<center>

## EIE2 Instruction Set Architecture & Compiler (IAC)

---
## Verification - a guide

**_@saturn691, V1.2 - 25 Oct 2024_**

---
</center>

## Introduction

Congratulations for taking the role of lead verification engineer! This guide
has been written by one of Peter's TAs and will follow from Lab 3.

## Aims

Your goal is to ensure that the CPU is **_functionally correct_**. 

## What should I do?

There are two main things in the testing world:

- Testing every single component. This is similar to what was done in Lab 3, and
is known in the industry as **_unit testing_**.
- Testing the CPU as a whole, known in the industry as **_integration testing_**.

Your CPU is going to be integration tested. Whether you choose to unit test
every component is your choice, and it depends on how much you love writing
tests.

## How do I start?

In the attached model repository there are examples of unit tests, and examples
of verification tests.

See [`mux_tb.cpp`](repo/tb/tests/mux_tb.cpp) for an example of a unit test.

See [`verify.cpp`](repo/tb/tests/verify.cpp) for how your CPU implementation 
will be tested.

Your first goal, as a team, is to get `verify.cpp` to pass. You can invoke the
tests by running the [`doit.sh`](repo/tb/doit.sh) script.

```cpp
TEST_F(CpuTestbench, BaseProgramTest)
{
    system("./compile.sh asm/program.S");

    for (int i = 0; i < 1000; i++)
    {
        runSimulation(1);
        if (top->a0 == 254)
        {
            SUCCEED();
        }
    }
    FAIL() << "Counter did not reach 254";
}
```

If you are using the attached repository, it will 
- generate a .hex file in the `rtl` folder.
- generate a .dis file in the `tb` folder. This is short for "disassembly". It
will be useful later (ignore this for now).
- generate a .vcd (waveform) file in the `tb` folder.

## How should I think?

This section will cover unit testbenches, as the test programs will be provided
on the spec release.

Whilst it may seem like duplicated work to write unit testbenches (if you are
writing a golden C++ model), oftentimes this gives a lot more freedom to the
RTL writers to implement their model, without worrying about causing bugs later
down the line.

I have not been very involved in the hardware verification space after this
coursework last year. Therefore I do not know every single best practice, but
these are some good guidelines:
- keep tests simple
- test the **_behaviour_**, not the implementation
- include some tests for simple cases (e.g. on reset)

There is a whole space on hardware verification, and there are loads of other
guides that go into a lot more depth. However, this should be enough
information for this coursework.

## Yeah, so what do I do?

The choice is yours, refer to the [aims](#aims) to guide you, and then use your
creativity!