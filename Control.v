`timescale 1ns / 1ps
module Control(input Clk, input [5:0] Instruction, output reg [1:0] ALUOp,
output reg RegWrite, MemtoReg, MemRead, MemWrite, Branch, ALUSrc, RegDst
    );
//ALUOp = 0 is Add immediate
//ALUOp = 1 is LUI
//ALUOp = 2 means decode from func
//ALUOp = 3 means nop

reg [3:0] state;

initial
begin
	state <= 0;
end

always @(*)
begin
	ALUOp = 3;
	RegWrite = 0;
	MemtoReg = 0;
	MemRead = 0;
	MemWrite = 0;
	Branch = 0;
	ALUSrc = 0;
	RegDst = 0;
	
	if (Instruction == 0)
	begin
	end
	
	else if (Instruction < 4)
	begin
		ALUOp = 2;
		RegWrite = 1;
		RegDst = 1;
	end
	
	else if (Instruction < 6)
	begin
		ALUSrc = 1;
		RegWrite = 1;
		
		if (Instruction == 5)
			ALUOp = 0;
		else if (Instruction == 4)
			ALUOp = 1;
			
	end
	
	else if (Instruction < 8)
	begin
		RegDst = 0;
		ALUOp = 0;
		ALUSrc = 1;
		
		if (Instruction == 6)
		begin
			MemRead = 1;
			RegWrite = 1;
			MemtoReg = 1;
			
		end
		
		if (Instruction == 7)
		begin
			MemWrite = 1;
			ALUSrc = 1;
		end
	end
	
	else if (Instruction < 9)
	begin
		Branch = 1;
		ALUOp = 0;
		//Jump Instruction will compare the same two registers
	end
	
	else if (Instruction < 11)
	begin
		//beq will happen with ALUOp = 0
		//bneq will happen with ALUOp = 1
		Branch = 1;	
		if (Instruction == 9)
			ALUOp = 0;
		else
			ALUOp = 1;
		
	end
	
end

endmodule
