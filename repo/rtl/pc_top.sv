module pc_top # (
    parameter DATA_WIDTH = 32
) (
    input logic clk,
    input logic rst,
    input logic PCsrc,
    input logic [DATA_WIDTH-1:0] ImmOp,
    output logic [DATA_WIDTH-1:0] out_PC,
)

    wire branch_PC;
    wire inc_PC;
    wire next_PC;
    wire PC;

    mux mux_pc (
        .in0 (branch_PC),
        .in1 (inc_PC),
        .sel (PCsrc),
        .out (PC)
    );

    adder adder_branch_pc (
        .in0 (PC),
        .in1 (ImmOp),
        .out (branch_PC)
    )

    adder adder_inc_pc (
        .in0 (PC),
        .in1 (4),
        .out (inc_PC)
    )

    pc_register PC_Reg (
        .clk (clk),
        .rst (rst),
        .next_PC (next_PC),
        .out_PC (out_PC)
    )

    assign out_PC = PC;

endmodule
