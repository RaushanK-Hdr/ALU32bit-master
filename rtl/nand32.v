		//NAND gate
module NAND_gate(A, B, Out); 
  input [31:0] A;
  input [31:0] B;
  output [31:0] Out;
  assign Out = ~(A & B);
endmodule