module pc_top # (
    parameter DATA_WIDTH = 32
) (
    input logic clk,
    input logic rst,
    input logic PCsrc, // mux sel line: select PC + Imm if 1, else select PC + 4 (increment by 4 bytes)
    input logic [DATA_WIDTH-1:0] ImmOp,
    output logic [DATA_WIDTH-1:0] PC
);

    wire [DATA_WIDTH-1:0] branch_PC;
    wire [DATA_WIDTH-1:0] inc_PC;
    wire [DATA_WIDTH-1:0] next_PC;

    mux mux_pc (
        .in0 (inc_PC),
        .in1 (branch_PC),
        .sel (PCsrc),
        .out (next_PC)
    );

    adder adder_branch_pc (
        .in0 (PC),
        .in1 (ImmOp),
        .out (branch_PC)
    );

    adder adder_inc_pc (
        .in0 (PC),
        .in1 (4),
        .out (inc_PC)
    );

    pc_register PC_Reg (
        .clk (clk),
        .rst (rst),
        .next_PC (next_PC),
        .out_PC (PC)
    );

endmodule
