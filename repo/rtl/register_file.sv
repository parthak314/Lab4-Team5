module register_file #(
    parameter   DATA_WIDTH = 32,
                ADDRESS_WIDTH = 5
)(
    input logic clk,
    input logic [ADDRESS_WIDTH-1:0]  AD1, 
    input logic [ADDRESS_WIDTH-1:0]  AD2, 
    input logic [ADDRESS_WIDTH-1:0]  AD3, // Address 3 
    input logic                      WE3, // Write enable
    input logic [DATA_WIDTH-1:0] WD3, // Content written at Address 3
    output logic [DATA_WIDTH-1:0] A0, // Content written at Address 3
    output logic [DATA_WIDTH-1:0] RD1,
    output logic [DATA_WIDTH-1:0] RD2
);

logic[DATA_WIDTH-1:0] reg_file [0:2**ADDRESS_WIDTH-1];

always_comb begin
    RD1 = reg_file[AD1];
    RD2 = reg_file[AD2];
    A0 = reg_file[10];
end

always @ (posedge clk) begin
    if (WE3) begin
        reg_file[AD3] <= WD3;
    end
end   

endmodule
