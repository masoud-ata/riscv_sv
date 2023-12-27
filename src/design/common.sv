package common;

    enum logic [2:0] 
    {
        ALU_AND = 3'b000,
        ALU_OR = 3'b001,
        ALU_ADD = 3'b010,
        ALU_SUB = 3'b110
    } alu_op;
    

    typedef enum logic [6:0] 
    {
        R_TYPE = 7'b0110011,
        ADDI = 7'b0010011,
        LOAD = 7'b0000011,
        STORE = 7'b0100011,
        B_TYPE = 7'b1100011
    } opcode_type;
    
    
    typedef struct packed
    {
        logic [2:0] alu_op;
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
        opcode_type opcode;
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

endpackage;