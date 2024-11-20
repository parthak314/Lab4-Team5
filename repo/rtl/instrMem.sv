module rom #(
    parameter ADDRESS_WIDTH = 16,
              DATA_WIDTH = 32
)(
    input logic [ADDRESS_WIDTH-1:0] addr,
    output logic [DATA_WIDTH-1:0] instr
);

logic [DATA_WIDTH-1:0] rom_array [2**ADDRESS_WIDTH-2:0];

initial begin
    $display("Loading rom.");
    $readmemh("instructions.mem", rom_array); 
    //this allows ROM to be loaded with content stored in sinerom.mem
end;

    always_comb begin
        instr = rom_array[addr >> 2]; //converts word addressing to decimal addressing
    end

endmodule
