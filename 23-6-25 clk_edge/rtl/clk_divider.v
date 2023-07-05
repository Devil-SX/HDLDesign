module clk_divider (
    input  clk,
    input  clk_2,
    output clk_2x
);
  reg clk_2x_reg = 1'b0;
  always @(posedge clk) begin
    @(posedge clk_2) clk_2x_reg <= ~clk_2x_reg;
  end

  assign clk_2x = clk_2x_reg;

endmodule
