`timescale 1ns / 1ps

module ALU_tb;

    // Inputs
    reg [31:0] A, B;
    reg [2:0] ALUControl;

    // Outputs
    wire [31:0] Result;
    wire OverFlow, Carry, Zero, Negative;

    // Instantiate the ALU
    ALU uut (
        .A(A),
        .B(B),
        .Result(Result),
        .ALUControl(ALUControl),
        .OverFlow(OverFlow),
        .Carry(Carry),
        .Zero(Zero),
        .Negative(Negative)
    );

    // Testbench logic
    initial begin
        // Test addition
        A = 32'h00000010; B = 32'h00000020; ALUControl = 3'b000; // A + B
        #10;
        $display("Add: A = %h, B = %h, Result = %h, Zero = %b, Carry = %b, OverFlow = %b, Negative = %b", A, B, Result, Zero, Carry, OverFlow, Negative);

        // Test subtraction
        A = 32'h00000030; B = 32'h00000010; ALUControl = 3'b001; // A - B
        #10;
        $display("Sub: A = %h, B = %h, Result = %h, Zero = %b, Carry = %b, OverFlow = %b, Negative = %b", A, B, Result, Zero, Carry, OverFlow, Negative);

        // Test AND
        A = 32'hFFFFFFFF; B = 32'h0000FFFF; ALUControl = 3'b010; // A & B
        #10;
        $display("AND: A = %h, B = %h, Result = %h", A, B, Result);

        // Test OR
        A = 32'hFFFFFFFF; B = 32'h0000FFFF; ALUControl = 3'b011; // A | B
        #10;
        $display("OR: A = %h, B = %h, Result = %h", A, B, Result);

        // Test SLT (Set Less Than)
        A = 32'h00000005; B = 32'h00000010; ALUControl = 3'b101; // A < B
        #10;
        $display("SLT: A = %h, B = %h, Result = %h", A, B, Result);

        // Test Zero flag
        A = 32'h00000010; B = 32'h00000010; ALUControl = 3'b001; // A - B = 0
        #10;
        $display("Zero Flag: A = %h, B = %h, Result = %h, Zero = %b", A, B, Result, Zero);

        // Test Negative flag
        A = 32'hFFFFFFFF; B = 32'h00000001; ALUControl = 3'b001; // A - B
        #10;
        $display("Negative Flag: A = %h, B = %h, Result = %h, Negative = %b", A, B, Result, Negative);

        // Test Overflow flag
        A = 32'h7FFFFFFF; B = 32'h00000001; ALUControl = 3'b000; // A + B
        #10;
        $display("Overflow Flag: A = %h, B = %h, Result = %h, OverFlow = %b", A, B, Result, OverFlow);

        // Test Carry flag
        A = 32'hFFFFFFFF; B = 32'h00000001; ALUControl = 3'b000; // A + B
        #10;
        $display("Carry Flag: A = %h, B = %h, Result = %h, Carry = %b", A, B, Result, Carry);

        // Finish simulation
        $finish;
    end

endmodule
