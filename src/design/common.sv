typedef struct 
{
    logic [4:0] pc;
    logic [31:0] instruction;
} if_id_type;


typedef struct packed
{
    logic [6:0] funct7;
    logic [4:0] rs2;
    logic [4:0] rs1;
    logic [2:0] funct3;
    logic [4:0] rd;
    logic [6:0] opcode;
} instruction_type;
