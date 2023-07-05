module booth2_tb ();

  // booth2 Signals
  wire [7:0] p;
  reg  [3:0] q;
  reg  [3:0] m;

  booth2 #(
      .WIDTH(4)
  ) u_booth2 (
      .m(m),
      .q(q),
      .p(p)
  );

  initial begin
    q = 2;
    m = 5;
    #10;
    q = 5;
    m = 2;
    #10;
    q = -1;
    #10;
    q = -1;
    m = -5;
    #10;
    q = 0;
    m = 5;
    #10;
    q = 1;
    m = 5;
    #10;
    q = 2;
    #10;
    q = 1;
    m = 1;
  end

  always @(q, m) begin
    $display("q =\t%b", q);
    $display("m =\t%b", m);
  end


  initial begin
    #100;
    $finish;
  end


  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, booth2_tb);
  end

endmodule
