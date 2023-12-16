package common;

    enum logic [2:0] 
    {
        ALU_AND = 3'b000,
        ALU_OR = 3'b001,
        ALU_ADD = 3'b010,
        ALU_SUB = 3'b110
    } alu_op;
    
    
    typedef struct 
    {
        logic [4:0] pc;
        logic [31:0] instruction;
    } if_id_type;
    
    
    typedef struct packed
    {
        logic [31:0] data1;
        logic [31:0] data2;
    } id_ex_type;
    

    typedef struct packed
    {
        logic [31:0] data;
    } ex_mem_type;
    
        
    typedef struct packed
    {
        logic [6:0] funct7;
        logic [4:0] rs2;
        logic [4:0] rs1;
        logic [2:0] funct3;
        logic [4:0] rd;
        logic [6:0] opcode;
    } instruction_type;

endpackage;