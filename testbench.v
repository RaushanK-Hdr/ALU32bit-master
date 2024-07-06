module testbench();//test-bench
  reg clkk;
  reg resett;
  reg [3:0] opcodee;
  reg [31:0] AA;
  reg [31:0] BB;
  reg [7:0] string [0:15];
  reg fx;
  
  wire [31:0] CC;

  // create ALU UNIT
  ALU_unit ALU (clkk, resett, AA, BB, CC, opcodee, err_fout);
   
  //CLOCK
  initial begin
    forever
      begin
       clkk = 0;
       #5;
       clkk = 1;
       #5;
      end
  end

  //Start Output Thread
  initial 
  begin
    	$dumpfile("dump.vcd");
		  $dumpvars;
    $display("+=+");
	  $display("|C|========+================================+=========================================+=============+=========================================+=====+");
	  $display("|L|Input                                    |ACC                                      |Instruction  |Next                                     |     |");  
	  $display("|K|#Hex    |BIN                             |#HEX    |BIN                             | CMD  |Opcode|#HEX    |BIN                             |Error|");  
	  $display("|=|========+================================|========+================================|======+======|========+================================|=====|");  
	  #3;//Offset to make sure data is not on the exact low-to-high positive edge.
    
    forever
    begin
      string[4'b0000] = {"No-op"};
      string[4'b0001] = {"ADD"};
      string[4'b0010] = {"SUB"};
      string[4'b0011] = {"MUL"};
      string[4'b0100] = {"DIV"};
      string[4'b0101] = {"REM"};
      string[4'b0110] = {"AND"};
      string[4'b0111] = {"OR"};
      string[4'b1000] = {"XOR"};
      string[4'b1001] = {"NOT"};
      string[4'b1010] = {"NAND"};
      string[4'b1011] = {"NOR"};
      string[4'b1100] = {"XNOR"};
      string[4'b1101] = {"SHL"};
      string[4'b1110] = {"SHR"};
      string[4'b1111] = {"RESET"};
      
      $display("|%1b|%8h|%32b|%s| %4b |%1b    |", 
      clkk,
      AA,
      AA,
      string[opcodee],
      opcodee,
      fx);
      #5;
    end
  end

  //STIMULOUS
  initial begin
    #2;
    fx=0;

    opcodee = 4'b0000;//no-op
    AA = 32'b00000000000000000000000000000000;
    BB = ALU.curC;
    #10;

    opcodee = 4'b1111;//reset
    AA = 32'b00000000000000000000000000000000;
    BB = ALU.curC;
    #10;

    opcodee = 4'b0001;//ADD
    AA = 32'b00000000000000000000000000000101;
    BB = ALU.curC;
    #10;
    
    opcodee = 4'b0010;//SUB
    AA = 32'b00000000000000000000000000000001;
    BB = ALU.curC;
    #10;

    opcodee = 4'b0011;//MUL
    AA = 32'b00000000000000000000000000000011;
    BB = ALU.curC;
    #10;

    opcodee = 4'b0100;//DIV
    AA = 32'b00000000000000000000000000000011;
    BB = ALU.curC;
    #10;


    opcodee = 4'b0101;//MOD
    AA = 32'b00000000000000000000000000000011;
    BB = ALU.curC;
    #10;

    opcodee = 4'b0110;//AND
    AA = 32'b00000000000000000000000011111111;
    BB = ALU.curC;
    #10;
    
    opcodee = 4'b0111;//OR
    AA = 32'b00000000001111111111111111111111;
    BB = ALU.curC;
    #10;
    
    opcodee = 4'b1000;//XOR
    AA = 32'b00000000000001010101010101010101;
    BB = ALU.curC;
    #10;

    opcodee = 4'b1001;//NOT
    AA = 0;
    BB = ALU.curC;
    #10;
       
    opcodee = 4'b1010;//NAND
    AA = 32'b00000000000000000000000000000111;
    BB = ALU.curC;
    #10;
    
    opcodee = 4'b1011;//NOR
    AA = 32'b00000000000000000000000000000111;
    BB = ALU.curC;
    fx=1;
    #10;
    
    opcodee = 4'b1100;//XNOR
    AA = 32'b00000000000000000000000000000111;
    BB = ALU.curC;
    fx=0;
    #10;

    opcodee = 4'b1101;//SHL
    AA = 32'b00000000000000000000000000111111;
    #10;

    opcodee = 4'b1110;//SHR
    AA = 32'b00000000000000000000000000111111;
    #10;

    opcodee = 4'b1111;//RESET
    AA = 32'b00000000000000000000000000000000;
    BB = ALU.curC;
    #10;

    $finish;
  end
endmodule
//=======================================[END :)]====================================//
