		//multiplier
module MUL_er(A, B, Out); 
  input [31:0] A;
  input [31:0] B;
  output [31:0] Out;
  reg [31:0] MUL_local;
  always @(*) begin
    MUL_local = A*B;
  end
  assign Out = MUL_local[31:0];
endmodule