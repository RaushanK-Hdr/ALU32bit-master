//1-bit logic shift left
module SHL_Logic(A, Out); 
  input [31:0] A;
  output [31:0] Out;
  reg [31:0] SHL_local;
  always @(*) begin
    SHL_local = (A << 1);
  end
  assign Out = SHL_local[31:0];
endmodule