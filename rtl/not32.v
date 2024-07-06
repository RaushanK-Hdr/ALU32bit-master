		//NOT gate
module NOT_gate(A, Out); 
  input [31:0] A;
  output [31:0] Out;
  assign Out = ~A;
endmodule