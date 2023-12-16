`timescale 1ns / 1ps


module mem_stage(
    input clk,
    input reset_n,
    input [31:0] data,
    output logic [31:0] data_out
);

    assign data_out = data;
    
endmodule
