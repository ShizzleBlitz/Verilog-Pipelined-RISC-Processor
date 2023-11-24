`timescale 1ns / 1ps
module ALU(input [4:0] Op,input [31:0] Data1,Data2, output reg zero, output reg [31:0] ALUOut
    );

always @(Op or Data1 or Data2)
begin
	ALUOut <= 0;
	zero <= 0;
	
	if (Op == 1)
	begin
		ALUOut <= Data1 + Data2;
		zero <= (Data1 == Data2);
	end
	
	if (Op == 2)
	begin
		ALUOut <= Data1 - Data2;
		zero <= Data1 == Data2;
	end
	
	else if (Op == 3)
			ALUOut <= Data1*Data2;
	else if (Op == 4)
	begin
			ALUOut <= Data2 <<< 16;
			zero <= Data1 != Data2;
	end
end

endmodule
