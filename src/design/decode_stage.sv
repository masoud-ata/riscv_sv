`timescale 1ns / 1ps

import common::*;


module decode_stage(
    input clk,
    input reset_n,
    input instruction_type instruction,
    input logic write_en,
    input logic [5:0] write_id,
    input logic [31:0] write_data,
    output logic [31:0] read_data1,
    output logic [31:0] read_data2,
    output logic is_write_back
);

    logic [31:0] rf_read_data1;
    logic [31:0] rf_read_data2;
    
    instruction_type instr;
     
    
    always_ff @(posedge clk) begin
        if (!reset_n) begin
            
        end
        else begin
            
        end 
    end
        
        
    always_comb begin
             
    end
    
    
    assign instr = instruction;
    
    
    register_file rf_inst(
        .clk(clk),
        .reset_n(reset_n),
        .write_en(write_en),
        .read1_id(instr.rs1),
        .read2_id(instr.rs2),
        .write_id(write_id),
        .write_data(write_data),
        .read1_data(rf_read_data1),
        .read2_data(rf_read_data2)        
    );
    
    
    assign read_data1 = rf_read_data1;
    assign read_data2 = rf_read_data2;
    
endmodule
