`timescale 1ns / 1ps
module DM(input MemWrite, MemRead, Clk,
input [7:0] Address, input [31:0] WriteData, output reg [31:0] ReadData
    );

reg [31:0] Memory [255:0];


always @(*)
begin
	if (MemRead)
		ReadData <= Memory[Address];
	else
		ReadData <= 0;
end

always @(posedge Clk)
begin
	if (MemWrite)
		Memory[Address] <= WriteData;
end

endmodule
