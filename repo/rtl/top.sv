module top #(
    DATA_WIDTH = 32
) (
    input   logic clk,
    input   logic rst,
    output  logic [DATA_WIDTH-1:0] a0    
);
    assign a0 = 32'd5;
    logic [DATA_WIDTH-1:0] pc, instr, immop;
    logic eq, pcsrc, alusrc, immsrc, regwrite;
    logic [2:0] aluctrl;

    pc_top pc_top_mod (
        .clk(clk),
        .rst(rst),
        .PCsrc(pcsrc),
        .ImmOp(immop),
        .PC(pc)
    );

    rom instr_mem_mod (
        .addr(pc),
        .instr(instr)
    );

    control_unit control_mod (
        .op(instr[6:0]),
        .eq(eq),
        .PCsrc(pcsrc),
        .ALUctrl(aluctrl),
        .ALUsrc(alusrc),
        .ImmSrc(immsrc),
        .RegWrite(regwrite)
    );

    signext signext_mod (
        .instr(instr[31:20]),
        .immSrc(immsrc),
        .immOp(immop)
    );

    alu_top alu_mod (
        .clk(clk),
        .ALUctrl(aluctrl),
        .ALUsrc(alusrc),
        .rs1(instr[19:15]),
        .rs2(instr[24:20]),
        .rd(instr[11:7]),
        .RegWrite(regwrite),
        .ImmOp(immop),
        .a0(a0),
        .EQ(eq)
    )

endmodule
