module alu_top #(
    parameter   DATA_WIDTH = 32,
                ADDRESS_WIDTH = 5
) (
    input   logic                       clk,
    input logic [2:0]                   ALUctrl,
    input logic                         ALUsrc,
    input logic [ADDRESS_WIDTH-1:0]     rs1, 
    input logic [ADDRESS_WIDTH-1:0]     rs2, 
    input logic [ADDRESS_WIDTH-1:0]     rd, 
    input logic                         RegWrite, 
    input logic [DATA_WIDTH-1:0]        ImmOp, 
    output logic [DATA_WIDTH-1:0]       a0, 
    output logic                        EQ
);

    logic [DATA_WIDTH-1:0]          ALUop2;
    logic [DATA_WIDTH-1:0]          ALUout;
    logic [DATA_WIDTH-1:0]          ALUop1;
    logic [DATA_WIDTH-1:0]          regOp2;

assign a0 = 32'd5;

alu myalu (
    .ALUop1(ALUop1),
    .ALUop2(ALUop2),
    .ALUctrl(ALUctrl),
    .ALUout(ALUout),
    .EQ(EQ)
);

mux mymux (
    .in0(regOp2),
    .in1(ImmOp),
    .sel(ALUsrc),
    .out(ALUop2)
);

register_file myreg (
    .clk(clk),
    .AD1(rs1),
    .AD2(rs2),
    .AD3(rd),
    .WE3(RegWrite),
    .WD3(ALUout),
    .A0(a0),
    .RD1(ALUop1),
    .RD2(regOp2)
);

endmodule
