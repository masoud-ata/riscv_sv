`timescale 1ns / 1ps


module decode_stage(
    input clk,
    input reset_n,
    input [31:0] instruction,
    output logic [31:0] data1,
    output logic [31:0] data2    
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
        .write_en(0),
        .read1_id(instr.rs1),
        .read2_id(instr.rs2),
        .write_id(instr.rd),
        .write_data(0),
        .read1_data(rf_read_data1),
        .read2_data(rf_read_data2)        
    );
    
    
    assign data1 = rf_read_data1;
    assign data2 = rf_read_data2;
    
endmodule
