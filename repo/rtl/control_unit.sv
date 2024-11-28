module control_unit #(
) (
    input logic [6:0]   op,
    input logic         eq,
    input logic [2:0]   func3,
    output logic        PCsrc,
    output logic [2:0]  ALUctrl,
    output logic        ALUsrc,
    output logic        ImmSrc,
    output logic        RegWrite
);
    logic branch;
    always_comb begin
        case (op)
            7'b1100011: begin RegWrite = 1'b0; ImmSrc = 1'b1; ALUsrc = 1'b0; branch = 1'b1; ALUctrl = 3'b001; end // bne
            7'b0010011: begin RegWrite = 1'b1; ImmSrc = 1'b1; ALUsrc = 1'b1; branch = 1'b0; ALUctrl = 3'b000; end // addi
            default: begin RegWrite = 1'b1; ImmSrc = 1'b0; ALUsrc = 1'b1; branch = 1'b0; ALUctrl = 3'b000; end
        endcase
    PCsrc = branch && ~eq;
    if (func3 == 3'b000) ;
    end

endmodule
