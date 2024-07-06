			//ERROR-CHECK
module ERROR_Check(clk, rst, add_of, LED);

  input clk;
  input rst;
  input add_of;
  output LED;
  wire Overflow_ERR;
  assign Overflow_ERR = add_of;
  wire ERROR_wire;
  reg ERROR_value;

  DFF ERROR_CHECKER (clk, Overflow_ERR, ERROR_wire);
  always@(*)
  begin
    ERROR_value = ERROR_wire;
    if (rst == 0)
    begin
      ERROR_value = 0;
    end
  end
  assign LED = ERROR_wire;
endmodule