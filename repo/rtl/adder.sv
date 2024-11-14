module adder # (
    parameter DATA_WIDTH = 32
) (
    input logic [DATA_WIDTH-1:0] in0,
    input logic [DATA_WIDTH-1:0] in1,
    output logic [DATA_WIDTH-1:0] out
);

    assign out = in0 + in1;

endmodule
