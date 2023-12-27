`timescale 1ns / 1ps

import common::*;


module control(
    input clk,
    input reset_n,
    input instruction_type instruction, 
    output control_type control
);

    localparam logic [16:0] ADD_INSTRUCTION = {7'b0000000, 3'b000, 7'b0110011};
    localparam logic [16:0] SUB_INSTRUCTION = {7'b0100000, 3'b000, 7'b0110011};
    localparam logic [9:0] ADDI_INSTRUCTION = {3'b000, 7'b0010011};
    localparam logic [9:0] LW_INSTRUCTION = {3'b010, 7'b0000011};
    localparam logic [9:0] SW_INSTRUCTION = {3'b010, 7'b0100011};
    localparam logic [9:0] BEQ_INSTRUCTION = {3'b000, 7'b1100011};
    
    
    always_comb begin
        control = '0;
        
        if ({instruction.funct7, instruction.funct3, instruction.opcode} == ADD_INSTRUCTION) begin
            control.alu_op = ALU_ADD;
            control.reg_write = 1'b1;
        end
        else if ({instruction.funct7, instruction.funct3, instruction.opcode} == SUB_INSTRUCTION) begin
            control.alu_op = ALU_SUB;
            control.reg_write = 1'b1;
        end
        else if ({instruction.funct3, instruction.opcode} == ADDI_INSTRUCTION) begin
            control.alu_op = ALU_ADD;
            control.reg_write = 1'b1;
            control.alu_src = 1'b1;        
        end
        else if ({instruction.funct3, instruction.opcode} == LW_INSTRUCTION) begin
            control.alu_op = ALU_ADD;
            control.alu_src = 1'b1;
            control.mem_read = 1'b1;
            control.reg_write = 1'b1;
            control.mem_to_reg = 1'b1;     
        end   
        else if ({instruction.funct3, instruction.opcode} == SW_INSTRUCTION) begin
            control.alu_op = ALU_ADD;
            control.alu_src = 1'b1;
            control.mem_write = 1'b1;  
        end                    
        else if ({instruction.funct3, instruction.opcode} == BEQ_INSTRUCTION) begin
            control.alu_op = ALU_SUB;
            control.is_branch = 1'b1;  
        end            
    end
    
endmodule
