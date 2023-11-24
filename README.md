# Verilog-Pipelined-RISC-Processor
This is a incomplete pipelined RISC processor created in verilog using a number of modules connected to each other.

The instructions as well as their syntax is written in the IM file. You can edit the IM file in order to add your own instructions.
An example of the instructions that can be executed is given below:

addi $1, $1, 3

Binary: 32'b000101_00001_00001_00000_00000_000011
	
addi $2, $2, 10

Binary: 32'b000101_00010_00010_00000_00000_001010
	
jump 44

Binary:  32'b001000_00000_00000_00000_00000_000111



**Values**

![Values](https://github.com/ShizzleBlitz/Verilog-Pipelined-RISC-Processor/assets/100959619/4aabd9d3-87d1-47bb-a552-4151a19f75be)

**Control Signals**

![Control](https://github.com/ShizzleBlitz/Verilog-Pipelined-RISC-Processor/assets/100959619/e04440c9-0feb-4c42-b24a-65792211908e)
