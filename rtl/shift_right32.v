//1-bit logic shift right
module SHR_Logic(A, Out); 
  input [31:0] A;
  output [31:0] Out;
  reg [31:0] SHR_local;
  always @(*) begin
    SHR_local = (A >> 1);
  end
  assign Out = SHR_local[31:0];
endmodule