`timescale 1ns / 1ps


module mem_stage(
    input clk,
    input reset_n,
    input [31:0] data,
    input control_type control_in,
    input control_type control_out,
    output logic [31:0] data_out
);

    assign data_out = data;
    assign control_out = control_in;
    
endmodule
