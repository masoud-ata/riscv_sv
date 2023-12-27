`timescale 1ns / 1ps

import common::*;


module execute_stage(
    input clk,
    input reset_n,
    input [31:0] data1,
    input [31:0] data2,
    input control_type control,
    output logic [31:0] result
);

    logic zero_flag;
    
    
    alu inst_alu(
        .control(ALU_ADD),
        .left_operand(data1), 
        .right_operand(data2),
        .zero_flag(zero_flag),
        .result(result)
    );
    
endmodule
