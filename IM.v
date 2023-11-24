`timescale 1ns / 1ps
module IM(input [7:0] Address, output reg [31:0] Instr
    );
reg [31:0] Instructions[127:0];

//For OPcode = [31:26] Instr
//000001 is for adding Registers
//000010 is for subtracting Registers
//000011 is for multiplying Registers
//000100 is for Load Upper Immediate
//000101 is for Adding Immediate
//000110 is for Load Word
//000111 is for Save Word
//001000 is for Jump Instruction
//001001 is for Branch if Equal
//001010 is for Branch if Inequal

//For Func = [5:0] Instr
//000001 is add Registers
//000010 is subtract Registers
//000011 is Multiply Registers

//000010 is lui. maybe subtract two from the constant before shifting.

//Editing this is how you program
initial
begin
	//Instructions need to be organized in order to work
	Instructions[0] = 0;
	
	//Addi $1, $1, 3
	Instructions[4] = 32'b000101_00001_00001_00000_00000_000011;
	
	//Addi $2, $2, 10
	Instructions[8] = 32'b000101_00010_00010_00000_00000_001010;
	
	//jump 44
	Instructions[12] = 32'b001000_00000_00000_00000_00000_000111;
	
	//sw $2, $1(0x0) 
	Instructions[44] = 32'b000111_00001_00010_00000_00000_000000;
	
	//sub $3, $2, $1
	Instructions[48] = 32'b000010_00010_00001_00011_00000_000010;
	
	//mult $4, $2, $1
	Instructions[52] = 32'b000011_00010_00001_00100_00000_000011;
	
	//bneq $1, $1, 88
	Instructions[56] = 32'b001010_00001_00001_00000_00000_000111;
	
	//lw $5, $1(0x0)
	Instructions[60] = 32'b000110_00001_00101_00000_00000_000000;
	
	//beq $2, $5, 92
	Instructions[76] = 32'b001001_00010_00101_00000_00000_000101;
	
end

always @(*)
begin
	Instr = Instructions[Address];
end

endmodule
