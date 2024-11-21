module top #(
    DATA_WIDTH = 32
) (
    input   logic clk,
    input   logic rst,
    output  logic [DATA_WIDTH-1:0] a0    
);
    assign a0 = 32'd5;
    logic [DATA_WIDTH-1:0] pc;
    logic [DATA_WIDTH-1:0] instr;
    logic eq, RegWrite, AlUctrl, 

    pc_top pc_top_inst (
        .clk(clk),
        .rst(rst),
        .PCsrc(),
        .ImmOp(),
        .PC(pc)
    );

    rom instr_mem (
        .addr(pc),
        .instr(instr)
    )

    control_unit control (
        .op(),
        .eq()
    )

endmodule
