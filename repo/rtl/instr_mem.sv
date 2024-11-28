module instr_mem #(
    parameter ADDRESS_WIDTH = 16,
              DATA_WIDTH = 8
)(
    input logic [32-1:0] addr,
    output logic [32-1:0] instr
);

logic [DATA_WIDTH-1:0] rom_array [2**ADDRESS_WIDTH-1:0];

initial begin
    $display("Loading rom.");
    $readmemh("../rtl/program.hex", rom_array); 
    //this allows ROM to be loaded with content stored in sinerom.mem
end;

    always_comb begin
        instr = {rom_array[addr[15:0]+3], rom_array[addr[15:0]+2], rom_array[addr[15:0]+1], rom_array[addr[15:0]+0]}; //converts word addressing to decimal addressing
        if(addr[31:16] == 16'b0) ;
    end

endmodule
