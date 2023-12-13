`timescale 1ns / 1ps


module program_memory (
    input clk,
    input [4:0] byte_address,
    input write_enable,         
    input [31:0] write_data, 
    output logic [31:0] read_data
);

    logic [31:0] ram [32];
    
    
    initial begin
        $readmemb("instruction_mem.mem", ram);
    end
    
    
    always @(posedge clk) begin
        if (write_enable) begin
            ram[byte_address] <= write_data;
        end 
    end
    
    assign read_data = ram[byte_address];

endmodule
