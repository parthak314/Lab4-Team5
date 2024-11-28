module signext # (
    parameter DATA_WIDTH = 32
)(
    input   logic   [DATA_WIDTH-1:20]   instr,
    input   logic                       immSrc,
    output  logic   [DATA_WIDTH-1:0]    immOp
);

always_comb begin
    // copy the lower 12 bits into immOp
    immOp[11:0] = instr[31:20];

    // sign extend if immSrc is high
    if (immSrc && instr[31])    
        immOp[DATA_WIDTH-1:12] = {20{1'b1}};
    else   
        immOp[DATA_WIDTH-1:12] = {20'b0};
end

endmodule
