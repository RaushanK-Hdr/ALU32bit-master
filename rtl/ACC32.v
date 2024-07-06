					//ACC
module DFF_register(clk, reset, inputA, Out); 
  input clk;
  input reset;
  input [31:0] inputA;
  output [31:0] Out;
  wire [31:0] zeroes;
  assign zeroes = {32{1'b0}};
  reg [31:0] rst;
  always @(posedge clk)
  begin
    rst = inputA;
    if (reset==1) begin
      rst = 0;
    end
  end
  assign Out = rst;
endmodule