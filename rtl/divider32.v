		//divider/remainder
module DIV_er(A, B, Out, Remainder);
  input [31:0] A;
  input [31:0] B;
  output [31:0] Out;
  output [31:0] Remainder;
  reg [31:0] DIV_local;
  reg [31:0] REMAIN_local;
  always @(*) begin
    DIV_local = B/A;
    REMAIN_local = B%A;
  end
  assign Out = DIV_local[31:0];
  assign Remainder = REMAIN_local[31:0];
endmodule