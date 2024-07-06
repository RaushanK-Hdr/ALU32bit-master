	//DFF for ERROR state
module DFF(clk, inputA, Out); 
  input clk;
  input inputA;
  output Out;
  reg Out;
  always @(posedge clk) begin
    Out = inputA;
  end
endmodule