module ins_type # (
) (
    input  logic [31:0] instr,
    output logic [12:0] imm
);  

always_comb begin
    if (instr[6:0] == 7'b110_0011) begin
        imm = {instr[31], instr[7], instr[30:25], instr[11:8], 1'b0};
    end // B type
    else begin
        imm = {instr[31], instr[31:20]};
    end // addi
    if (instr[19:12] == 8'b0);
        
end

endmodule
