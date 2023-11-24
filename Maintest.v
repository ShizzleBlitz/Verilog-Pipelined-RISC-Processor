`timescale 1ns / 1ps
module Maintest;

	// Inputs
	reg Clk;

	// Outputs
	wire [31:0] RegA;
	wire [31:0] RegB;
	wire [31:0] IR;
	wire [31:0] PCPlus4F;
	wire [31:0] InstrExt;
	wire [31:0] PCAdded;
	wire [31:0] Data2;
	wire [31:0] Result;
	wire [31:0] MemData;
	wire [31:0] WriteData;
	wire [4:0] WriteReg;
	wire [4:0] Op;
	wire [31:0] PC;
	wire [63:0] IFID;
	wire [146:0] IDEX;
	wire [106:0] EXMEM;
	wire [70:0] MEMWB;
	wire [1:0] ALUOp;
	wire RegWrite;
	wire MemtoReg;
	wire MemRead;
	wire MemWrite;
	wire Branch;
	wire ALUSrc;
	wire RegDst;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	Main uut (
		.Clk(Clk), 
		.RegA(RegA), 
		.RegB(RegB), 
		.IR(IR), 
		.PCPlus4F(PCPlus4F), 
		.InstrExt(InstrExt), 
		.PCAdded(PCAdded), 
		.Data2(Data2), 
		.Result(Result), 
		.MemData(MemData), 
		.WriteData(WriteData), 
		.WriteReg(WriteReg), 
		.Op (Op),
		.PC(PC), 
		.IFID(IFID), 
		.IDEX(IDEX), 
		.EXMEM(EXMEM), 
		.MEMWB(MEMWB), 
		.ALUOp(ALUOp), 
		.RegWrite(RegWrite), 
		.MemtoReg(MemtoReg), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.Branch(Branch), 
		.ALUSrc(ALUSrc), 
		.RegDst(RegDst), 
		.zero(zero)
	);

	initial begin
		// Initialize Inputs
		Clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	always #50 Clk = ~Clk;
      
endmodule
