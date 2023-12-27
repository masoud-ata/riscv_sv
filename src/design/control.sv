`timescale 1ns / 1ps

import common::*;


module control(
    input clk,
    input reset_n,
    input instruction_type instruction, 
    output control_type control
);

    always_comb begin
        control = '0;
        case (instruction.opcode)
            R_TYPE : begin
                control.alu_op = 2'b10;
                control.reg_write = 1'b1;
            end
        
            ADDI : begin
                control.alu_op = 2'b10;
                control.reg_write = 1'b1;
                control.alu_src = 1'b1;
            end
            
            LOAD : begin
                control.alu_src = 1'b1;
                control.mem_read = 1'b1;
                control.reg_write = 1'b1;
                control.mem_to_reg = 1'b1;
            end
            
            STORE : begin
                control.alu_src = 1'b1;
                control.mem_write = 1'b1;
            end
            
            B_TYPE : begin
                control.alu_op = 2'b01;
                control.is_branch = 1'b1;       
            end
        endcase             
    end
    
endmodule
