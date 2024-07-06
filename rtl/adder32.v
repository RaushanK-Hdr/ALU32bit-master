			//ADDER
module ADD_er(A, B, SUM, Cout); 
  input [31:0] A;
  input [31:0] B;
  output Cout;
  output [31:0] SUM;
  reg [31:0] SUM_local,Cout_local;
  always @(*) begin
    {Cout_local,SUM_local[31:0]} = A+B;
  end
  assign SUM = SUM_local[31:0]; //SUM
  assign Cout = Cout_local[31:0]; //Cout
endmodule