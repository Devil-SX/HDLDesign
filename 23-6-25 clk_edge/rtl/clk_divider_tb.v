module clk_divider_tb ();

  reg  clk;
  reg  clk_2;
  wire clk_2x;

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    clk_2 = 0;
    forever #10 clk_2 = ~clk_2;
  end


  initial begin
    #5000 $finish;
  end

  clk_divider dut (
      .clk(clk),
      .clk_2(clk_2),
      .clk_2x(clk_2x)
  );


  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, clk_divider_tb);
  end
endmodule
