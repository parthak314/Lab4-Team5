## errors

### top.sv

- line 2 - should have `parameter` keyword
- line 53 - missing `;`
- line 11, 30 - `aluctrl` declared as 3 bits but only implemented in `alu` module as 1 bit value
    - implemented as 1 bit as we only have 2 instructions but should be 3 bits as we develop
- line 22 - confliction as `pc` is 32 bit, but `addr` declared as 16 bit. confliction
    - see `instr_mem` section below
- `[14:12]` of `instr` not being used - corresponds to “func 3” field of the word
    - control unit should be expanded to account for not just `opcode` but also func 3 and func 7 fields

### control_unit.sv

- missing endline after endmodule
- lines 14 to 18:
    - current syntax invalid, need `begin, end` if executing multiple commands per case
    - `ImmSrc` is a 1 bit, should not be assigning `2'b0` to it
- line 20 - missing ;
- line 20 - misspelt `PCSrc`, should be `PCsrc` (no capital s)
- likewise, would be nice to keep consistent naming convention (i.e. IMMsrc instead of ImmSrc)

### alu_top.sv

- line 1 - module name should match file name, i.e. should be `alu_top` not `top`
- line 6 - `ALUctrl` should be 3 bit (currently 1 bit) as mentioned above
    - there are conflictions between `top`, `alu_top` and `alu`
- line 29 - `AluOUT` misspelt, should be `ALUout`
- why line 23 `assign a0 = 32'd5;`
    - fudging verification test?

### instr_mem.sv

- line 1 - wrong module name, should follow file name as `instr_mem`
    - conflicts with module instantiation in top.sv
    - either rename file or correct instantiation
- `ADDRESS_WIDTH` should be 32 bit as we are working with 8 byte addresses (see briefing diagram)
    - it is conflicting with the `pc` register which is implemented as 32 bit

---