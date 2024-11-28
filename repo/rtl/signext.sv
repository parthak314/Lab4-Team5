module signext # (
    parameter DATA_WIDTH = 32
)(
    input   logic   [12:0]              imm,
    input   logic                       immSrc,
    output  logic   [DATA_WIDTH-1:0]    immOp
);

always_comb begin
    // imm is 13 bits (because of BNE imm)
    immOp[12:0] = imm;

    // sign extend if immSrc is high
    if (immSrc && imm[12])    
        immOp[DATA_WIDTH-1:13] = {19{1'b1}};
    else   
        immOp[DATA_WIDTH-1:13] = {19'b0};
end

endmodule
