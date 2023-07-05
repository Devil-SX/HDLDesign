module sparse_adder64_tb();

  reg [63:0] A;
  reg [63:0] B;
  wire [63:0] SUM;
  wire CO;

  sparse_adder64 uut(
    .A(A),
    .B(B),
    .SUM(SUM),
    .CO(CO)
  );

  reg [63:0] ADDER_SUM;
  reg ADDER_CO;
  integer error;

  generate
    for (genvar i = 0; i < 1000; i=i+1) begin : test_case
      initial begin
        error = 0;

        A = $random;
        B = $random;
        #100;

        // Calculate sum and carry using built-in adder
        {ADDER_CO, ADDER_SUM} = A + B;
        $display("%b",CO);
        if (SUM != ADDER_SUM || CO != ADDER_CO) begin
          $display("ERROR: SIMULATION RESULT DOES NOT MATCH IDEAL VALUE!");
          $display("A = %h, B = %h", A, B);
          $display("SUM  = %h (simulation), %h (ideal)", SUM, ADDER_SUM);
          $display("CO = %d (simulation), %d (ideal)", CO, ADDER_CO);
          error = 1;
        end
      end
    end
  endgenerate

  initial begin
    #5000;
    $display("Simulation finished.");
    $finish(error);
  end

endmodule