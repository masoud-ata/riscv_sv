`timescale 1ns / 1ps


module alu(
    input wire [2:0] control,
    input wire [31:0] left_operand, 
    input wire [31:0] right_operand,
    output logic zero_flag,
    output logic [31:0] result 
);

    enum logic [2:0] 
    {
        AND = 3'b000,
        OR = 3'b001,
        ADD = 3'b010,
        SUB = 3'b110
    } alu_op;
    
    always_comb begin
        case (control)
            AND: result = left_operand & right_operand;
            OR: result = left_operand | right_operand;
            ADD: result = left_operand + right_operand;
            SUB: result = left_operand - right_operand;
            default: result = left_operand + right_operand;
        endcase
    end
    
    assign zero_flag = 1'b1 ? result == 0 : 1'b0;

endmodule
