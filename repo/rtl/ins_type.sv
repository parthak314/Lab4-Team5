module ins_type # (
) (
    input  logic [31:0] instruction
    output logic [11:0] imm
);  

always_comb begin
    if instr[6:0] == 7'b110_0011: // B type
        imm = {imm[11:8], imm[30:25], imm[7], imm[31]}
    else if instr[6:0] = 7'b001_0011: // addi
        imm = instr[20:31]
end

endmodule
