*Team details:*
- (**pcadders**) Program Counter and related adders - *Clarke Chong*
- (**regalumux**) The Register File, ALU and the related MUX. - *Kevin Aubleeck*
- (**cusignins**) The Control Unit, the Sign-extension Unit and the instruction memory. - *Partha Khanna*
- (**complete**) The testbench and verification of the whole design working via gtkWave and Vbuddy - *Joel Ng*
---
## Program Counter and related adders
### interface signals
- `clk`
- `rst`
- `PCsrc`
- `ImmOp`
- `PC` - **output**

### implementation
- `branch_PC` = `PC` + `ImmOp`
  - `ImmOp` taken from `Sign extend` block
- `inc_PC` = `PC` + 4
  - each instruction is 4 bytes (32-BIT), hence increment PC by 4


---
## The Register File, ALU and the related MUX

---
## The Control Unit, the Sign-extension Unit and the instruction memory

Required tasks:
- Control Unit - IN (`EQ`, `instr`) + OUT (`RegWrite`, `ALUctrl`, `ALUsrc`, `ImmSrc`, `PCsrc`)
- Instr Mem - IN (`A`) + OUT (`RD` (instr))
- Sign Extended - IN (`instr`) + OUT (`ImmSrc`, `ImmOp`)
SystemVerilog files for each of these based on their performances.

### Control Unit

### Sign Extension
#### Overview
This block is required to  implement a 12 bit sign extender to 32 bit signed integer, making use of combinational logic (does not take a clock cycle to complete with no state or memory).
This will be located in the data path and handles immediate values in the instructions.

This will also allow smaller bit-width values to be interpreted as 32 bit signed while preserving the sign and makes use of combinational logic instead of sequential since the result is produced immediately when the input changes which makes this scalable with pipelining in the future and is a flexible model adapting to different data widths as per `parameter DATA_WIDTH = 32`.

#### System Implementation
The system **inputs** here are:
- `instr`: 32-bit input representing the instruction with the lower 12 bits as the immediate value.
- `immSrc`: A control signal indicating whether sign extension is to be used
The system **outputs** here are:
- `immOp`: 32-bit output which is the sign extended immediate.

The key logic here being:
```systemverilog
immOp[11:0] = instr[11:0]; 
if (immSrc && instr[11] == 1'b1) 
	immOp[DATA_WIDTH-1:12] = {20{1'b1}}; 
else 
	immOp[DATA_WIDTH-1:12] = 20'b0;
```

This will sign extend `immOp` with:
- upper bits filled with `1`s if `immSrc` is high and `instr[11] = 1`
- upper bits filled with `0`s if:
	- `immSrc` is high and `instr[11] = 0`
	- `immSrc` is low

#### Testing
Using G-test (testing framework) and verilator (to simulate the verilog code), we can set this up by:
- declaring a pointer to the verilated model of verilog (signext) by `Vsignext* dut`
- `SetUp()`: dynamically allocates memory for a new instance of the verilated signext which is a simulation
- `TearDown()`: deletes the instance by `delete dut;`

Test Cases:
- ==Positive Immediate (No Sign Extension)== - a positive 12 bit immediate (e.g. 0x00A) is sign extended to 32 bits (to 0x0000000A)
- ==Negative Immediate (Sign Extension)== - a negative 12 bit immediate (e.g. 0xFFA) is sign extended to 32 bits (to 0xFFFFFFFFA)
- ==No Sign Extension (ImmSrc = 0)==


---
## The testbench and verification of the whole design working
