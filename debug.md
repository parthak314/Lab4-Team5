## errors

### register_file.sv
- A0
	- Changed to read off X10 register 
		- Convention according to RISCV spec

### Instrmem.sv
- Address Width 
	- Changed from 32 bit to 8 bit 
	- Rom becomes $32*8$ from $32 *32$ using much less memory


### top.sv

[](https://github.com/parthak314/Lab4-Team5/blob/debugging/debug.md#topsv)

- line 2 - should have `parameter` keyword
- line 53 - missing `;`
- line 11, 30 - `aluctrl` declared as 3 bits but only implemented in `alu` module as 1 bit value
    - implemented as 1 bit as we only have 2 instructions but should be 3 bits as we develop
- line 22 - confliction as `pc` is 32 bit, but `addr` declared as 16 bit. confliction
    - see `instr_mem` section below
- `[14:12]` of `instr` not being used - corresponds to “func 3” field of the word
    - control unit should be expanded to account for not just `opcode` but also func 3 and func 7 fields

### control_unit.sv

[](https://github.com/parthak314/Lab4-Team5/blob/debugging/debug.md#control_unitsv)

- missing endline after endmodule
- lines 14 to 18:
    - current syntax invalid, need `begin, end` if executing multiple commands per case
    - `ImmSrc` is a 1 bit, should not be assigning `2'b0` to it
- line 20 - missing ;
- line 20 - misspelt `PCSrc`, should be `PCsrc` (no capital s)
- likewise, would be nice to keep consistent naming convention (i.e. IMMsrc instead of ImmSrc)

### alu_top.sv

[](https://github.com/parthak314/Lab4-Team5/blob/debugging/debug.md#alu_topsv)

- line 1 - module name should match file name, i.e. should be `alu_top` not `top`
- line 6 - `ALUctrl` should be 3 bit (currently 1 bit) as mentioned above
    - there are conflictions between `top`, `alu_top` and `alu`
- line 29 - `AluOUT` misspelt, should be `ALUout`
- why line 23 `assign a0 = 32'd5;`
    - fudging verification test?

### instr_mem.sv

[](https://github.com/parthak314/Lab4-Team5/blob/debugging/debug.md#instr_memsv)

- line 1 - wrong module name, should follow file name as `instr_mem`
    - conflicts with module instantiation in top.sv
    - either rename file or correct instantiation
- `ADDRESS_WIDTH` should be 32 bit as we are working with 8 byte addresses (see briefing diagram)
    - it is conflicting with the `pc` register which is implemented as 32 bit


## Extend block
- INS type checks for the instruction type 
	- Checks for i type or b type
	- Takes 32 bit instruction and selects based on opcode
- Branch offset(Lab 4 implementation ) 
	- 12 bit immediate concatenated with LSB being 0 as the offset
		- We cannot disregard the lowest bit because it's always assumed to be 0 
	- We disregard the MSB to return it to 12 bit to make it work neatly
- Future branch offset for RiscV 
	- MSB ,at the start, used to determine sign for extend block but after it enters the loop, its disregarded and shifted out by 1
	- imm is kept at 12 bits long 