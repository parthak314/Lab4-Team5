module alu# ( 
    parameter   ADDRESS_WIDTH = 32 
)(
    input logic [ADDRESS_WIDTH-1:0]     ALUop1,
    input logic [ADDRESS_WIDTH-1:0]     ALUop2,
    input logic                         ALUctrl,
    output logic [ADDRESS_WIDTH-1:0]    ALUout,
    output logic EQ
);

always_comb begin
    case(ALUctrl)
        1'b0: begin 
            ALUout = ALUop1 + ALUop2;
            EQ = (ALUop1 == ALUop2); //EQ 1 if equal Xnor
        end
        1'b1: begin 
            ALUout = {ADDRESS_WIDTH{(ALUop1 == ALUop2)}}; //AluOUT is 32b'0 or 32b'1
            EQ = (ALUop1 == ALUop2); 
        end
        default: begin
            ALUout = 0;
            EQ = 0;
        end
    endcase
end

endmodule