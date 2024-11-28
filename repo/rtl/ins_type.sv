module ins_type # (
) (
    input  logic [31:0] instr,
    output logic [11:0] imm
);  

always_comb begin
    if (instr[6:0] == 7'b110_0011) begin
        imm = {instr[7], instr[30:25], instr[11:8], 1'b0};
    end // B type
    else if (instr[6:0] == 7'b001_0011) begin
        imm = instr[31:20];
    end // addi
        
end

endmodule
