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


---
## The testbench and verification of the whole design working
