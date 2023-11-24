`timescale 1ns / 1ps
module Registers(input RegWrite, Clk, input [31:0] WriteData, input [4:0] Rs,Rt,Rd,
	output reg [31:0] Data1,Data2
    );

reg [31:0] registers[31:0];

integer i;

initial
begin
	Data1 = 0;
	Data2 = 0;
	for (i = 0; i < 32; i = i+1)
	begin
		registers[i] <= 0;
	end
end

always @(*)
begin
	Data1 <= registers[Rs];
	Data2 <= registers[Rt];
end

always @(posedge Clk)
begin
	if (RegWrite == 1)
	begin
		registers[Rd] <= WriteData;
	end
end

endmodule
