`timescale 1ns / 1ps

import common::*;


module cpu(
    input clk,
    input reset_n
);

    logic [4:0] program_mem_address = 0;
    logic program_mem_write_enable = 0;         
    logic [31:0] program_mem_write_data = 0; 
    logic [31:0] program_mem_read_data;
    
    logic [31:0] decode_data1;
    logic [31:0] decode_data2;
    
    logic [31:0] execute_result;
    
    if_id_type if_id_reg;
    id_ex_type id_ex_reg;
    
   
    always_ff @(posedge clk) begin
        if_id_reg.pc <= program_mem_address;
        if_id_reg.instruction <= program_mem_read_data;
        
        id_ex_reg.data1 <= decode_data1;
        id_ex_reg.data2 <= decode_data2;
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
        .instruction(if_id_reg.instruction),
        .data1(decode_data1),
        .data2(decode_data2)
    );
    
    execute_stage inst_execute(
        .clk(clk), 
        .reset_n(reset_n),
        .data1(id_ex_reg.data1),
        .data2(id_ex_reg.data2),
        .result(execute_result)             
    );

endmodule
