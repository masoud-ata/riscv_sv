`timescale 1ns / 1ps

`include "common.sv"


module cpu(
    input clk,
    input reset_n
);

    logic [4:0] program_mem_address = 0;
    logic program_mem_write_enable = 0;         
    logic [31:0] program_mem_write_data = 0; 
    logic [31:0] program_mem_read_data;
    
    if_id_type if_id_reg;
    
   
    always_ff @(posedge clk) begin
        if_id_reg.pc <= program_mem_address;
        if_id_reg.instruction <= program_mem_read_data;
    end


    program_memory inst_mem(
        .clk(clk),        
        .byte_address(program_mem_address),
        .write_enable(program_mem_write_enable),
        .write_data(program_mem_write_data),
        .read_data(program_mem_read_data)
    );
    
    
    fetch_stage inst_fetch(
        .clk(clk), 
        .reset_n(reset_n),
        .address(program_mem_address),
        .data(program_mem_read_data)
    );
    
    
    decode_stage inst_decode(
        .clk(clk), 
        .reset_n(reset_n),    
        .instruction(if_id_reg.instruction)
    );

endmodule
