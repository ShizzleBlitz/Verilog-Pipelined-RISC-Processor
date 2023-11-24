`timescale 1ns / 1ps
module ALUControl(input [5:0] Instruction, input [1:0] ALUOp, output reg [4:0] Op
    );
//Op = 0 is nop
//Op = 1 is add
//Op = 2 is subtract
//OP = 3 is multiply
//Op = 4 is lui

always @(*)
begin
	case(ALUOp)
	3 : Op = 0;
	0 : Op = 1;
	1 : Op = 4;
	2 : 
		begin
		if (Instruction == 1)
			Op = 1;
		else if (Instruction == 2)
			Op = 2;
		else if (Instruction == 3)
			Op = 3;
		end
	endcase
end

endmodule
