			//subtractor
module SUB_er(A, B, Out);//subtractor
  input [31:0] A;
  input [31:0] B;
  output [31:0] Out;
  reg [31:0] SUB_local;
  always @(*) begin
    SUB_local = B-A;
  end
  assign Out = SUB_local[31:0];
endmodule