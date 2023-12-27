package common;

    typedef enum logic [2:0] 
    {
        ALU_AND = 3'b000,
        ALU_OR = 3'b001,
        ALU_ADD = 3'b010,
        ALU_SUB = 3'b011
    } alu_op_type;
    
    
    typedef enum logic [2:0]
    {
        R_TYPE,
        I_TYPE,
        S_TYPE,
        B_TYPE,
        U_TYPE,
        J_TYPE
    } encoding_type;
    
    
    typedef struct packed
    {
        alu_op_type alu_op;
        encoding_type encoding;
        logic alu_src;
        logic mem_read;
        logic mem_write ;
        logic reg_write;
        logic mem_to_reg;
        logic is_branch;
    } control_type;
    
    
    typedef struct packed
    {
        logic [6:0] funct7;
        logic [4:0] rs2;
        logic [4:0] rs1;
        logic [2:0] funct3;
        logic [4:0] rd;
        logic [6:0] opcode;
    } instruction_type;
    
        
    typedef struct  packed
    {
        logic [4:0] pc;
        instruction_type instruction;
    } if_id_type;
    
    
    typedef struct packed
    {
        logic [31:0] data1;
        logic [31:0] data2;
        control_type control;
    } id_ex_type;
    

    typedef struct packed
    {
        logic [31:0] data;
    } ex_mem_type;
    
    
    typedef struct packed
    {
        logic [31:0] data;
    } mem_wb_type;

endpackage
