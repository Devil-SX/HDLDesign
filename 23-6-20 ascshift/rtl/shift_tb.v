module shift_tb;
  reg clk;
  reg rst_n;
  reg [8*8-1:0] i_data;
  wire [7:0] o_data;
  reg i_rsq_n;
  wire o_busy;
  
  shift #(
    .WIDTH(8) // 模块参数
  ) dut(
    .clk(clk),
    .rst_n(rst_n),
    .i_data(i_data),
    .o_data(o_data),
    .i_rsq_n(i_rsq_n),
    .o_busy(o_busy)
  ); // 实例化模块
  
  initial begin
    clk = 0;
    rst_n = 1;
    i_data = 64'h1234567812345678;
    i_rsq_n = 1;
    #10 rst_n = 0;
    #10 rst_n = 1;
    #10 i_rsq_n = 0;
    #10 i_rsq_n = 1;
    #80 $finish;
  end
  
  always #5 clk = ~clk; // clk的时钟
  
  initial begin
    $dumpfile("shift_tb.vcd");
    $dumpvars(0, shift_tb);
  end
endmodule
