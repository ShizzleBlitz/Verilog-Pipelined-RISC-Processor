`timescale 1ns / 1ps
module Main(
input Clk,
output [31:0] RegA, RegB, IR, PCPlus4F, InstrExt, PCAdded, Data2, Result, MemData, WriteData,
output [4:0] WriteReg, Op,
output reg [31:0] PC,

//will be of different sizes
output reg [63:0] IFID, 
output reg [146:0] IDEX,
output reg [106:0] EXMEM,
output reg [70:0] MEMWB,
output [1:0] ALUOp,
output RegWrite, MemtoReg, MemRead, MemWrite, Branch, ALUSrc, RegDst, zero
    );
	 
IM Instructions(PC, IR);

Registers Regs(MEMWB[69], Clk, WriteData, IFID[25:21], IFID[20:16], MEMWB[4:0], RegA, RegB);

DM Memory(EXMEM[105], EXMEM[104], Clk, EXMEM[68:37], EXMEM[36:5], MemData);

Control Signals(Clk, IFID[31:26], ALUOp, RegWrite, MemtoReg, MemRead, MemWrite, Branch, ALUSrc, RegDst);

ALUControl ALUSignals(IDEX[15:10], IDEX[139:138] , Op);

ALU operations(Op, IDEX[105:74], Data2, zero, Result);


assign PCPlus4F = PC + 4;
assign InstrExt[15:0] = IFID[15:0];
assign InstrExt[31:16] = IFID[15]? 16'b1111111111111111: 16'b0000000000000000;
assign PCAdded = 	IDEX[137:106] + (IDEX[41:10] << 2);
assign Data2 = IDEX[145]? IDEX[41:10]: IDEX[73:42];
assign WriteReg = IDEX[146]? IDEX[4:0]: IDEX[9:5];
assign WriteData = MEMWB[70]? MEMWB[68:37] : MEMWB[36:5];

initial
begin
	PC = 0;
end

always @(posedge Clk)
begin
	//Assigning values to the IFID Register
	IFID[31:0] <= IR;
	IFID[63:32] <= PCPlus4F;

	//Assigning vallues to the IDEX Register
	IDEX[4:0] <= IFID[15:11];
	IDEX[9:5] <= IFID[20:16];
	IDEX[41:10] <= InstrExt;
	IDEX[73:42] <= RegB;
	IDEX[105:74] <= RegA;
	IDEX[137:106] <= IFID[63:32];
	IDEX[139:138] <= ALUOp;
	IDEX[140] <= RegWrite;
	IDEX[141] <= MemtoReg;
	IDEX[142] <= MemRead;
	IDEX[143] <= MemWrite;
	IDEX[144] <= Branch;
	IDEX[145] <= ALUSrc;
	IDEX[146] <= RegDst;
	
	//Assigning values to the EXMEM Register
	EXMEM[4:0] <= WriteReg;
	EXMEM[36:5] <= IDEX[73:42];
	EXMEM[68:37] <= Result;
	EXMEM[69] <= zero;
	EXMEM[101:70] <= PCAdded;
	EXMEM[102] <= IDEX[140];
	EXMEM[103] <= IDEX[141];
	EXMEM[104] <= IDEX[142];
	EXMEM[105] <= IDEX[143];
	EXMEM[106] <= IDEX[144];
	
	//Assigning values to the MEMWB Register
	MEMWB[4:0] <= EXMEM[4:0];
	MEMWB[36:5] <= EXMEM[68:37];
	MEMWB[68:37] <= MemData;
	MEMWB[69] <= EXMEM[102];
	MEMWB[70] <= EXMEM[103];
	
	//changing the value of PC depending on this
	if (EXMEM[69] & EXMEM[106])
		PC <= EXMEM[101:70];
	else
		PC <= PCPlus4F;
		
end

endmodule
