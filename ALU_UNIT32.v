						//ALU UNIT
module ALU_unit(clk,reset,A,B,C,opcode, ERR_out);//ALU UNIT
  input clk;
  input reset;
  input [3:0] opcode;
  input [31:0] A;
  input [31:0] B;
  output [31:0] C;
  output ERR_out;
  
  reg [31:0] curA;
  reg [31:0] curB;
  reg [31:0] curC;
  reg curERROR;

  reg [31:0] nextA;
  reg [31:0] nextB;
  reg [31:0] nextC;
  reg nextERROR;

  wire rst_wire;
  wire clk_wire;
  wire [31:0] inputA_wire;
  wire [31:0] inputB_wire;

  assign rst_wire = reset;
  assign clk_wire = clk;
  assign inputA_wire = A;
  assign inputB_wire = B;

  wire opcode_s0;
  wire opcode_s1;
  wire opcode_s2;
  wire opcode_s3;
  
  assign opcode_s0 = opcode[0];
  assign opcode_s1 = opcode[1];
  assign opcode_s2 = opcode[2];
  assign opcode_s3 = opcode[3];

  wire [3:0] opcode_MUX;
  wire [31:0] zeros_wire;
  wire [31:0] ADD_out_wire;
  wire carry_error_wire;
  wire [31:0] SUB_out_wire;
  wire [31:0] MUL_out_wire;
  wire [31:0] DIV_out_wire;
  wire [31:0] remainder_wire;
  wire [31:0] AND_out_wire;
  wire [31:0] OR_out_wire;
  wire [31:0] XOR_out_wire;
  wire [31:0] NOT_out_wire;
  wire [31:0] NAND_out_wire;
  wire [31:0] NOR_out_wire;
  wire [31:0] XNOR_out_wire;
  wire [31:0] SHL_out_wire;
  wire [31:0] SHR_out_wire;

  assign zeros_wire = {32'b0};
  assign opcode_MUX = opcode;

  wire [31:0] MUX_out_wire;
  wire [31:0] reg_out_wire;
  wire ERROR_result;
  

  ADD_er        Ch1  (inputA_wire, inputB_wire, ADD_out_wire, carry_error_wire);
  SUB_er        Ch2  (inputA_wire, inputB_wire, SUB_out_wire);
  MUL_er        Ch3  (inputA_wire, inputB_wire, MUL_out_wire);
  DIV_er        Ch4  (inputA_wire, inputB_wire, DIV_out_wire, remainder_wire);
  AND_gate      Ch5  (inputA_wire, inputB_wire, AND_out_wire);
  OR_gate       Ch6  (inputA_wire, inputB_wire, OR_out_wire);
  XOR_gate      Ch7  (inputA_wire, inputB_wire, XOR_out_wire);
  NOT_gate      Ch8  (inputB_wire, NOT_out_wire);
  NAND_gate     Ch9 (inputA_wire, inputB_wire, NAND_out_wire);
  NOR_gate      Ch10 (inputA_wire, inputB_wire, NOR_out_wire);
  XNOR_gate     Ch11 (inputA_wire, inputB_wire, XNOR_out_wire);
  SHL_Logic     Ch12 (inputA_wire, SHL_out_wire);
  SHR_Logic     Ch13 (inputA_wire, SHR_out_wire);
  
  MUX CMD (
	.in0(reg_out_wire),
	.in1(ADD_out_wire),
	.in2(SUB_out_wire),
	.in3(MUL_out_wire),
	.in4(DIV_out_wire),
	.in5(remainder_wire),
	.in6(AND_out_wire),
	.in7(OR_out_wire),
	.in8(XOR_out_wire),
	.in9(NOT_out_wire),
	.in10(NAND_out_wire),
	.in11(NOR_out_wire),
	.in12(XNOR_out_wire),
	.in13(SHL_out_wire),
	.in14(SHR_out_wire),
	.in15(zeros_wire),
	.sel(opcode_MUX),
	.out(MUX_out_wire)
  );
  
  DFF_register  ACC (clk_wire, rst_wire, MUX_out_wire, reg_out_wire);
  ERROR_Check   ERR (clk_wire, rst_wire, carry_error_wire, ERROR_result);

  always @(*)
  begin
    curA = A;
    curB = B;
    curC = reg_out_wire;
    curERROR = ERROR_result;

    nextA = A;
    nextB = B;
    nextC = MUX_out_wire;
    nextERROR = carry_error_wire;
  end

  assign C = reg_out_wire; 
  assign ERR_out = ERROR_result;

endmodule