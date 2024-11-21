module control_unit #(
) (
    input logic [6:0]   op,
    input logic         eq,
    output logic        PCsrc,
    output logic [2:0]  ALUctrl,
    output logic        ALUsrc,
    output logic        ImmSrc,
    output logic        RegWrite
);
    logic branch;
    always_comb begin
        case (op)
            7'b0000011: RegWrite = 1'b1; ImmSrc = 2'b0; ALUsrc = 1'b1; branch = 1'b0; ALUctrl = 3'b000;
            7'b0100011: RegWrite = 1'b0; ImmSrc = 2'b1; ALUsrc = 1'b1; branch = 1'b0; ALUctrl = 3'b000;
            7'b0110011: RegWrite = 1'b1; ImmSrc = 2'b0; ALUsrc = 1'b0; branch = 1'b0; ALUctrl = 3'b000;
            7'b1100011: RegWrite = 1'b0; ImmSrc = 2'b0; ALUsrc = 1'b0; branch = 1'b1; ALUctrl = 3'b001;
            default: RegWrite = 1'b1; ImmSrc = 1'b0; ALUsrc = 1'b1; branch = 1'b0; ALUctrl = 3'b000;
        endcase
    PCSrc = branch && eq
    end

endmodule